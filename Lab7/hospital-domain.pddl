(define (domain hospital)
  (:requirements :strips :typing :negation :equality)
  (:types ambulance patient location hospital)

  (:predicates
    (at ?a - ambulance ?l - location)            ; ambulance at location
    (patient-at ?p - patient ?l - location)     ; patient at location (or at hospital)
    (in-ambulance ?p - patient ?a - ambulance)  ; patient inside ambulance
    (connected ?l1 - location ?l2 - location)   ; connectivity
    (blocked ?l1 - location ?l2 - location)     ; blocked route
    (empty ?a - ambulance)                      ; ambulance empty
  )

  ;; Move ambulance between locations if connected and not blocked
  (:action move
    :parameters (?a - ambulance ?from - location ?to - location)
    :precondition (and (at ?a ?from) (connected ?from ?to) (not (blocked ?from ?to)))
    :effect (and (at ?a ?to) (not (at ?a ?from)))
  )

  ;; Pickup a patient
  (:action pickup-patient
    :parameters (?p - patient ?a - ambulance ?l - location)
    :precondition (and (at ?a ?l) (patient-at ?p ?l) (empty ?a))
    :effect (and (in-ambulance ?p ?a) (not (patient-at ?p ?l)) (not (empty ?a)))
  )

  ;; Dropoff a patient at a hospital location
  (:action dropoff-patient
    :parameters (?p - patient ?a - ambulance ?h - location)
    :precondition (and (at ?a ?h) (in-ambulance ?p ?a))
    :effect (and (patient-at ?p ?h) (empty ?a) (not (in-ambulance ?p ?a)))
  )

)

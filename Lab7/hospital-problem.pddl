(define (problem hospital-example)
  (:domain hospital)
  (:objects
    a1 a2 - ambulance
    p1 p2 p3 - patient
    loc1 loc2 loc3 h1 h2 - location
  )
  (:init
    ;; ambulances located at hospitals initially (example)
    (at a1 h1)
    (at a2 h2)

    ;; patients at locations
    (patient-at p1 loc1)
    (patient-at p2 loc2)
    (patient-at p3 loc3)

    ;; ambulances empty
    (empty a1) (empty a2)

    ;; connectivity (example undirected links)
    (connected h1 loc1)
    (connected loc1 h1)
    (connected h1 loc2)
    (connected loc2 h1)
    (connected h2 loc3)
    (connected loc3 h2)
    (connected loc2 loc3)
    (connected loc3 loc2)

    ;; blocked edges (example: none blocked). To block, add e.g. (blocked loc2 loc3)
    ;;(blocked loc2 loc3)
  )

  (:goal (and
    (patient-at p1 h1)
    (patient-at p2 h2)
    (patient-at p3 h1)
  ))
)

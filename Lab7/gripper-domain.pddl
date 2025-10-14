(define (domain gripper)
  (:requirements :strips :typing :negation :equality)
  (:types room ball gripper)

  (:predicates
    (ROOM ?r - room)        ; optional type predicate (kept for readability)
    (BALL ?b - ball)
    (GRIPPER ?g - gripper)
    (at-robby ?r - room)           ; robby at room
    (at-ball ?b - ball ?r - room)  ; ball at room
    (free ?g - gripper)            ; gripper free
    (carry ?g - gripper ?b - ball) ; gripper carries ball
  )

  ;; Move robby between rooms
  (:action move
    :parameters (?from - room ?to - room)
    :precondition (and (ROOM ?from) (ROOM ?to) (at-robby ?from))
    :effect (and (at-robby ?to) (not (at-robby ?from)))
  )

  ;; Pick up a ball with a gripper
  (:action pick-up
    :parameters (?ball - ball ?room - room ?gr - gripper)
    :precondition (and (BALL ?ball) (ROOM ?room) (GRIPPER ?gr)
                       (at-ball ?ball ?room) (at-robby ?room) (free ?gr))
    :effect (and (carry ?gr ?ball)
                 (not (at-ball ?ball ?room))
                 (not (free ?gr)))
  )

  ;; Drop a ball from a gripper
  (:action drop
    :parameters (?ball - ball ?room - room ?gr - gripper)
    :precondition (and (BALL ?ball) (ROOM ?room) (GRIPPER ?gr)
                       (carry ?gr ?ball) (at-robby ?room))
    :effect (and (at-ball ?ball ?room) (free ?gr) (not (carry ?gr ?ball)))
  )
)

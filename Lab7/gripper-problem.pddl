(define (problem gripper-balls)
  (:domain gripper)
  (:objects
    rooma roomb - room
    ball1 ball2 ball3 ball4 - ball
    left right - gripper
  )
  (:init
    ;; type facts (optional)
    (ROOM rooma) (ROOM roomb)
    (BALL ball1) (BALL ball2) (BALL ball3) (BALL ball4)
    (GRIPPER left) (GRIPPER right)

    ;; initial positions
    (at-robby rooma)
    (at-ball ball1 rooma) (at-ball ball2 rooma) (at-ball ball3 rooma) (at-ball ball4 rooma)

    ;; grippers free
    (free left) (free right)
  )

  (:goal (and
    (at-ball ball1 roomb)
    (at-ball ball2 roomb)
    (at-ball ball3 roomb)
    (at-ball ball4 roomb)
  ))
)

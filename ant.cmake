if(NOT DEFINED NSTEPS)
  set(NSTEPS 10)
endif()
message("number of steps: ${NSTEPS}")

# initialize the ant's position and heading
set(ANT_X 0)
set(ANT_Y 0)
set(ANT_HEADING N)

# define some utility macros
macro(rotate_right)
  if(ANT_HEADING STREQUAL N)
    set(ANT_HEADING E)
  elseif(ANT_HEADING STREQUAL E)
    set(ANT_HEADING S)
  elseif(ANT_HEADING STREQUAL S)
    set(ANT_HEADING W)
  else()
    set(ANT_HEADING N)
  endif()
endmacro()

macro(rotate_left)
  if(ANT_HEADING STREQUAL N)
    set(ANT_HEADING W)
  elseif(ANT_HEADING STREQUAL W)
    set(ANT_HEADING S)
  elseif(ANT_HEADING STREQUAL S)
    set(ANT_HEADING E)
  else()
    set(ANT_HEADING N)
  endif()
endmacro()

# simulate the motion of the ant
foreach(i RANGE 1 ${NSTEPS}-1)
  # print the current ant position and heading
  set(CURRENT_POS ${ANT_X},${ANT_Y})
  message("ant position: (${CURRENT_POS}) facing ${ANT_HEADING}")

  # change the square color and rotate
  list(FIND BLACK_SQUARES ${CURRENT_POS} LIST_INDEX)
  if(LIST_INDEX EQUAL -1)
    # location not found therefore the current square is white
    list(APPEND BLACK_SQUARES ${CURRENT_POS})
    rotate_right()
  else()
    # the current square is black
    list(REMOVE_ITEM BLACK_SQUARES ${CURRENT_POS})
    rotate_left()
  endif()

  # now move the ant
  if(ANT_HEADING STREQUAL N)
    math(EXPR ANT_Y "${ANT_Y}+1")
  elseif(ANT_HEADING STREQUAL E)
    math(EXPR ANT_X "${ANT_X}+1")
  elseif(ANT_HEADING STREQUAL S)
    math(EXPR ANT_Y "${ANT_Y}-1")
  else()
    math(EXPR ANT_X "${ANT_X}-1")
  endif()
endforeach()

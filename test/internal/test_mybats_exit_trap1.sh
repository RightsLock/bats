#!/bin/bash
# test for mybats_exit_trap
source mybats-exec-test

test_main() {
  #set -x
  mybats_init $0
  trap "mybats_exit_trap" exit
  exec 3<&1
  MYBATS_ERROR_STATUS=0
  MYBATS_TEARDOWN_COMPLETED=1
	MYBATS_TEST_NUMBER=$1
  MYBATS_TEST_DESCRIPTION="$2"
  # create and pass MYBATS_OUT to caller via ${lines[0]}
  basename "$0" > $MYBATS_OUT
  echo $MYBATS_OUT
  # myskip will exit 0, we will never return
  # mybats_exit_trap will be called by the trap
  myskip "$3"
}

# call our function
test_main "$@"
# never reached
exit 234

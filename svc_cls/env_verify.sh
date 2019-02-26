!/bin/bash
# @brief environment-/system-specific script to be called from post_update.sh
#        returns 0 or 1 value to $errorCheck in post_update.sh for overall
#        status to be emailed out upon script conclusion.  This script
#        will contain environment-specific verification commands.

###########################
# Begin Body              #

errorCheck=0

log_info "========================================================"
log_info "= Environment-specific starts and checks"
log_info "========================================================"

# Start Feedzai Processes


# Watch Feedzai serverLog file for a couple minutes to make sure it comes up before continuing
while [ "$result" -lt 1 ] && [ "$count" -lt 9 ]; do
    sleep 20
   #result=$(grep -c '*** Ready!' <feedzai server file>)
    count=$((count + 1))
done

# If Feedzai processes haven't started by now, manual intervention/review will be necessary
if [ "$result" -lt 1 ] && [ "$count" -ge 9 ]; then
    log_error "Process has NOT started"
    errorCheck=1
else
    log_info "Process has started successfully"
fi

return $errorCheck

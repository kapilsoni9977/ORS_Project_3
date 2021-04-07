package in.co.rays.proj3.exception;

/**
 * DuplicateRecordException thrown when a duplicate record occurred
 *
 * @author Kapil Soni
 * @version 1.0
 * @Copyright (c) RAYS Technologies
 *
 */

public class DuplicateRecordException extends Exception {

    /**
     * @param msg
     *            error message
     */
    public DuplicateRecordException(String msg) {
        super(msg);
    }

}

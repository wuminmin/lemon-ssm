package com.lssm.model;

public class LemonUser {
    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column lemon_user.id
     *
     * @mbggenerated Wed Jun 08 09:49:09 GMT+08:00 2016
     */
    private Integer id;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column lemon_user.seat_num
     *
     * @mbggenerated Wed Jun 08 09:49:09 GMT+08:00 2016
     */
    private Integer seatNum;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column lemon_user.username
     *
     * @mbggenerated Wed Jun 08 09:49:09 GMT+08:00 2016
     */
    private String username;

    /**
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column lemon_user.password
     *
     * @mbggenerated Wed Jun 08 09:49:09 GMT+08:00 2016
     */
    private String password;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column lemon_user.id
     *
     * @return the value of lemon_user.id
     *
     * @mbggenerated Wed Jun 08 09:49:09 GMT+08:00 2016
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column lemon_user.id
     *
     * @param id the value for lemon_user.id
     *
     * @mbggenerated Wed Jun 08 09:49:09 GMT+08:00 2016
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column lemon_user.seat_num
     *
     * @return the value of lemon_user.seat_num
     *
     * @mbggenerated Wed Jun 08 09:49:09 GMT+08:00 2016
     */
    public Integer getSeatNum() {
        return seatNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column lemon_user.seat_num
     *
     * @param seatNum the value for lemon_user.seat_num
     *
     * @mbggenerated Wed Jun 08 09:49:09 GMT+08:00 2016
     */
    public void setSeatNum(Integer seatNum) {
        this.seatNum = seatNum;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column lemon_user.username
     *
     * @return the value of lemon_user.username
     *
     * @mbggenerated Wed Jun 08 09:49:09 GMT+08:00 2016
     */
    public String getUsername() {
        return username;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column lemon_user.username
     *
     * @param username the value for lemon_user.username
     *
     * @mbggenerated Wed Jun 08 09:49:09 GMT+08:00 2016
     */
    public void setUsername(String username) {
        this.username = username == null ? null : username.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column lemon_user.password
     *
     * @return the value of lemon_user.password
     *
     * @mbggenerated Wed Jun 08 09:49:09 GMT+08:00 2016
     */
    public String getPassword() {
        return password;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column lemon_user.password
     *
     * @param password the value for lemon_user.password
     *
     * @mbggenerated Wed Jun 08 09:49:09 GMT+08:00 2016
     */
    public void setPassword(String password) {
        this.password = password == null ? null : password.trim();
    }
}
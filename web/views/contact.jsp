
<%@ include file="/views/includeHeader.jsp" %>


<section id="content">
    <div class="contact-info">
        <div class="container">
            <div class="contact-info-wrapper clearfix">
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="contact-item-wrapper">
                        <h4>Address</h4>
                        <div class="info">
                            <div class="icon">
                                <i class="icon-location-pin"></i>
                            </div>
                            <p>9676 INSAT Urban Center North BP Tunis Cedex 1080
                            </p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="contact-item-wrapper">
                        <h4>Phone</h4>
                        <div class="info">
                            <div class="icon">
                                <i class="icon-screen-smartphone"></i>
                            </div>
                            <p>+216 26-726-840 <br>+216 25-011-291</p>
                        </div>
                    </div>
                </div>
                <div class="col-md-4 col-sm-4 col-xs-12">
                    <div class="contact-item-wrapper">
                        <h4>E-mail</h4>
                        <div class="info">
                            <div class="icon">
                                <i class="icon-paper-plane"></i>
                            </div>
                            <p>

                                med.khalilnouisser@gmail.com <br>
                                rafaaseddik@yahoo.fr
                            </p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-md-12">
                <div class="header-wrap text-center">
                    <h3>Send us a messages</h3>
                </div>
            </div>
        </div>
    </div>
    <div class="contact-form-wrapper">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <form id="contactForm" class="contact-form" data-toggle="validator">
                        <div class="row">
                            <div class="col-md-6 col-xs-12">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="name" name="name" placeholder="Full Name" required data-error="Please enter your name">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="email" class="form-control" id="email" placeholder="mail@sitename.com" required data-error="Please enter your email">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <input type="text" class="form-control" id="msg_subject" name="subject" placeholder="Subject" required data-error="Please enter your subject">
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-6 col-xs-12">
                                <div class="row">
                                    <div class="col-md-12">
                                        <div class="form-group">
                                            <textarea class="form-control" id="message" placeholder="Massage" rows="9" data-error="Write your message" required></textarea>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-12 col-xs-12">
                                <button type="submit" id="submit" class="btn btn-common">Send Message</button>
                                <div id="msgSubmit" class="h3 text-center hidden"></div>
                                <div class="clearfix"></div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</section>

<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d4546.941163649235!2d10.195482825129037!3d36.84333353214412!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x12fd34c6d1e93bef%3A0x4153c4733f285343!2sInstitut+national+des+sciences+appliqu%C3%A9es+et+de+technologie!5e0!3m2!1sfr!2stn!4v1517529197944" width="100%" height="450" frameborder="0" style="border:0" allowfullscreen></iframe>


<%@ include file="/views/includeFooter.jsp" %>

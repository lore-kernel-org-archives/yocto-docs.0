Received: from cpanel7.indieserve.net (cpanel7.indieserve.net [199.212.143.8])
 by mx.groups.io with SMTP id smtpd.web11.12370.1587060374299955273
 for <docs@lists.yoctoproject.org>;
 Thu, 16 Apr 2020 11:06:14 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.8, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:51822 helo=localhost.localdomain)
	by cpanel7.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1jP8tw-00E2AR-Ba
	for docs@lists.yoctoproject.org; Thu, 16 Apr 2020 14:06:13 -0400
Date: Thu, 16 Apr 2020 14:06:09 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
X-X-Sender: rpjday@localhost.localdomain
To: docs@lists.yoctoproject.org
Subject: Re: [docs] Possible changes to the project docs
In-Reply-To: <CAP71WjwPdXB36essZJ62sogNq+Qpf1wx3cEGpjKQ3MTDmgFY7w@mail.gmail.com>
Message-ID: <alpine.LFD.2.21.2004161404130.54465@localhost.localdomain>
References: <135fccacd4ee8a1ffe0e06f6f95c22e05dadf04a.camel@linuxfoundation.org> <20200415152105.GA11838@linux-uys3> <alpine.LFD.2.21.2004161247290.35575@localhost.localdomain> <CAP71WjxP3VE8YQo5sS43rOxWzhqhz40Zd2gkX2AGVYxNEdD8oQ@mail.gmail.com>
 <alpine.LFD.2.21.2004161345410.53638@localhost.localdomain> <CAP71WjwPdXB36essZJ62sogNq+Qpf1wx3cEGpjKQ3MTDmgFY7w@mail.gmail.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel7.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel7.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel7.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: multipart/mixed; boundary="8323328-1662444766-1587060372=:54465"

--8323328-1662444766-1587060372=:54465
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Thu, 16 Apr 2020, Nicolas Dechesne wrote:

>
>
> On Thu, Apr 16, 2020 at 7:46 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
>       On Thu, 16 Apr 2020, Nicolas Dechesne wrote:
>
>       > As I put in one of my emails before you can use my dev branch:
>       >
>       > https://git.linaro.org/people/nicolas.dechesne/poky.git/log/?h=sphinx
>       >
>       > then it's just
>       > pip3 install sphinx
>       > # to use the non default theme
>       > pip3 install sphinx_rtd_theme
>       >
>       > cd documentation make html
>       >
>       > and it should generate exactly that on your local folder
>       > https://people.linaro.org/~nicolas.dechesne/yp-docs/
>       >
>       > I am happy to take patches in this branch (or create/maintain a
>       > contrib branch if more folks want to play/experiment and send
>       > patches).
>
>         definitely need some mechanism to handle docbook entities and basic
>       tags like <filename> ... i'm still poring over pandoc, can it be
>       configured to deal with that?
>
>         will go read more ...
>
>
> It does 'most of the time'. See:
> https://people.linaro.org/~nicolas.dechesne/yp-docs/bsp-guide/bsp.xml.html#bsp-layers
>
> where the docbook source is:
>        Each repository is a BSP layer supported by the Yocto Project                                  
>                                                                                                      
>                          
>         (e.g. <filename>meta-raspberrypi</filename> and                                              
>                                                                                                      
>                            
>         <filename>meta-intel</filename>).                                                            
>                                                                                                      
>                            
>  I am not sure if it always does the *right* thing though.. and I
> have seen occurrences where it failed. I am wondering if we should
> 'fix' pandoc , or just spend some time fixing the output of pandoc.
> I don't think we will avoid reading/checking each manual, anyways..
> I was thinking we could use pandoc for 80% of the work, some regex
> for 15% and then manually finish the work.. it might be a bit
> optimistic ;)

  interesting ... if you go to the top-level page:

https://people.linaro.org/~nicolas.dechesne/yp-docs/bsp-guide/bsp-guide.xml.html

the <filename> tag in the third note is *not* migrated over, you can
still see the tag. i suspect there will be plenty of tweaking, but i'm
still totally on-board with this, and am willing to contribute.

rday

--8323328-1662444766-1587060372=:54465--

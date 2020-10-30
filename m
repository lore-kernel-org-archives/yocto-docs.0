Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.12873.1604061345207079821
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 05:35:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:58172 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kYTd9-004xys-3S; Fri, 30 Oct 2020 08:35:43 -0400
Date: Fri, 30 Oct 2020 08:35:40 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] adt-manual: delete obsolete ADT manual, and related content
In-Reply-To: <CAP71WjzfwKuxox9PbfO2ArhJhyhSo5q2KDkPgt4-y5YnkyEvzQ@mail.gmail.com>
Message-ID: <658164b7-d4bd-e584-d855-c2ef9ec16ed7@crashcourse.ca>
References: <532f9817-d5ba-b38a-aa64-7a7f6d2765ef@crashcourse.ca> <CAP71WjzfwKuxox9PbfO2ArhJhyhSo5q2KDkPgt4-y5YnkyEvzQ@mail.gmail.com>
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday+crashcourse.ca/only user confirmed/virtual account not confirmed
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=US-ASCII

On Fri, 30 Oct 2020, Nicolas Dechesne wrote:

> On Fri, Oct 30, 2020 at 10:35 AM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> > Since the ADT manual has long been superseded by the SDK manual,
> > remove the entire adt-manual directory, and the references to it in
> > the two top-level files "conf.py" and "poky.yaml".
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> thanks for the patch. It looks good, however I am unable to apply it
> locally (and Richard as well can't). Can you please check and
> resend?

  that's weird, i built it on top of the master branch. i'll try
again.

rday

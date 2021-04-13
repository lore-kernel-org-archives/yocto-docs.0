Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.6673.1618306378728373374
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 02:32:59 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.107.13]:56294 helo=fedora)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lWFPk-006j0Q-Cb; Tue, 13 Apr 2021 05:32:57 -0400
Date: Tue, 13 Apr 2021 05:32:53 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
cc: Janne Kiiskila <janne.kiiskila@pelion.com>, 
    "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH]Variables - WKS_FILE tip finding one used
In-Reply-To: <266de944-aab4-2e1d-021f-d722d15339e3@bootlin.com>
Message-ID: <4788fc62-112d-b2cb-2292-e87a6282a214@crashcourse.ca>
References: <DBAPR08MB5558B9EA79319C4C09AC1802F3709@DBAPR08MB5558.eurprd08.prod.outlook.com> <266de944-aab4-2e1d-021f-d722d15339e3@bootlin.com>
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
Content-Type: multipart/mixed; boundary="8323328-1317940820-1618306376=:8649"

--8323328-1317940820-1618306376=:8649
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8BIT

On Mon, 12 Apr 2021, Michael Opdenacker wrote:

> Hi Janne,
>
> On 4/12/21 2:48 PM, Janne Kiiskila wrote:
> >
> >  
> >
> > Adding tip on how to find the WKS_FILE being used in the build.

... big snip ...

>  
> +      To find out which WKS_FILE your build is using, you can run
> +      ``bitbake -e |grep "^WKS_FILE="``
> +
>     :term:`WKS_FILE_DEPENDS`
>        When placed in the recipe that builds your image, this variable lists
>        build-time dependencies. The ``WKS_FILE_DEPENDS`` variable is only

  while this is undeniably useful information, the same tip could be
added to pretty much every variable in the variable glossary, so i'm
not sure we want to start doing that; i think it would be far more
useful to make this a general hint somewhere.

  i also recall, from years gone by, that chris larson had a cool
utility named "bb" that would search in a *proper* way for the values
of variables by actually digging into the data dictionary, rather than
the clearly hackier way of grep'ing through the output of "bitbake
-e".

rday

--8323328-1317940820-1618306376=:8649--

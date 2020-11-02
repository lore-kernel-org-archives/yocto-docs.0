Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.28327.1604305890817254149
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Nov 2020 00:31:31 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpeac202e043973-cmac202e043970.sdns.net.rogers.com ([174.114.100.179]:59312 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kZVFQ-00160c-AW; Mon, 02 Nov 2020 03:31:28 -0500
Date: Mon, 2 Nov 2020 03:31:27 -0500 (EST)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] globally change ":doc:`../<manual>" to ":doc:`/<manual>"
In-Reply-To: <CAP71Wjw3SyLCc5982b=1oDWXxSQ+Bc1VuUj1Apf6LDm5ikhm2A@mail.gmail.com>
Message-ID: <40a85c72-14c4-e298-1ad4-99ca025331@crashcourse.ca>
References: <365bd4ec-fc1-f599-7553-f92352694fd2@crashcourse.ca> <CAP71Wjw3SyLCc5982b=1oDWXxSQ+Bc1VuUj1Apf6LDm5ikhm2A@mail.gmail.com>
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

On Mon, 2 Nov 2020, Nicolas Dechesne wrote:

> hey Robert,
>
> On Sat, Oct 31, 2020 at 8:08 PM Robert P. J. Day <rpjday@crashcourse.ca> wrote:
> >
> > Apparently, the :doc: directive works fine with absolute
> > pathnames, which are more stable in case any .rst files get moved
> > around, so change all relative pathnames to absolute pathnames via
> > a simple Perl script.
> >
> > Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>
> The patch looks good, but this time again, I am not able to apply it
> locally. I hope it's not something wrong on my end.. But using both
> "git am" and "patch" fails for me.

  ok, this is just weird, i'll look into this.

rday

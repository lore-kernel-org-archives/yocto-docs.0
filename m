Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web12.1038.1604091244444256500
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 13:54:04 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:40168 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kYbPO-006pB1-1q; Fri, 30 Oct 2020 16:54:02 -0400
Date: Fri, 30 Oct 2020 16:54:00 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Quentin Schulz <foss@0leil.net>
cc: YP docs mailing list <docs@lists.yoctoproject.org>, 
    Nicolas Dechesne <nicolas.dechesne@linaro.org>
Subject: Re: [docs] possible marker cleanup: ": ::$" -> "::"
In-Reply-To: <02192FE0-FFAB-43AC-A4F1-4B779EA28991@0leil.net>
Message-ID: <d97993c4-2f27-4da2-b31e-6783bf83f154@crashcourse.ca>
References: <d39d9b0-512a-d035-cd5-f6313bf41d@crashcourse.ca> <CAP71Wjy0uvFbN4+yQHOteCVef0Jb9d98U_1jM05D2pc9Bx-iDQ@mail.gmail.com> <02192FE0-FFAB-43AC-A4F1-4B779EA28991@0leil.net>
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

On Fri, 30 Oct 2020, Quentin Schulz wrote:

...
> Anyway, I don't really like it because it's not that explicit
> (though it is documented) that :: without a space actually is
> identical to : ::. At the same time, it's a "programming language"
> thing/quirk/implementation so I'm sure we can teach/document/enforce
> it as much as we would for Python or any other language one uses.
...

  i know exactly what you mean; it seems arbitrary but, in fact, the
reST docs stress that this *is* the way to do it:

  Literal blocks

  Literal code blocks (ref) are introduced by ending a paragraph with
  the special marker ::.

i'm currently poring over the reST and sphinx docs ... i should be an
expert by the time donald trump is re-elected.

kidding. i'm kidding.

jesus, i *better* be kidding.

rday

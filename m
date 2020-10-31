Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web10.4056.1604169416747510825
 for <docs@lists.yoctoproject.org>;
 Sat, 31 Oct 2020 11:36:57 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from cpef81d0f814063-cmf81d0f814060.cpe.net.cable.rogers.com ([174.114.57.56]:48206 helo=localhost.localdomain)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.93)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1kYvkE-00BGZ3-Qr; Sat, 31 Oct 2020 14:36:55 -0400
Date: Sat, 31 Oct 2020 14:36:52 -0400 (EDT)
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] any reason for relative "../" in :doc:`../<manual-name>/...`?
In-Reply-To: <CAP71WjzgFV3tfuPJVcgHsqH=6pn9DrEsp49uKOrQEZiCbETFdQ@mail.gmail.com>
Message-ID: <cc9fc69f-34a-7e8a-7171-885704f53cf@crashcourse.ca>
References: <28aabb6-01-4ca8-2c64-f76b7ecf5a8f@crashcourse.ca> <CAP71WjzgFV3tfuPJVcgHsqH=6pn9DrEsp49uKOrQEZiCbETFdQ@mail.gmail.com>
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
Content-Type: multipart/mixed; boundary="8323328-369672489-1604169414=:11009"

--8323328-369672489-1604169414=:11009
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT

On Sat, 31 Oct 2020, Nicolas Dechesne wrote:

> Le sam. 31 oct. 2020 à 18:22, Robert P. J. Day <rpjday@crashcourse.ca> a écrit :
>
>         just noticed numerous :doc: items in, for example, ref-manual/
>       directory that use "../" as a relative location, as in:
>
>       resources.rst:-  :doc:`../sdk-manual/sdk-manual` *manual :* This
>       resources.rst:-  :doc:`../bsp-guide/bsp` *:* This guide defines the structure
>       resources.rst:-  :doc:`../kernel-dev/kernel-dev` *:* This manual describes
>       resources.rst:-  :doc:`../ref-manual/ref-manual` *:* This
>
>       i'm fairly sure you can write those with absolute pathnames, as in:
>
>       resources.rst:-  :doc:`/sdk-manual/sdk-manual` *manual :*
>
>       this would seem to be more stable just in case some .rst files are
>       moved around. thoughts? it appears that the underlying HTML generated
>       in either case is identical, unless i screwed something up.
>
> That would be much better! I don’t know why i didn’t do that in the
> first place... but if it works then please send a patch!

  it *seems* to work, i'll make absolutely sure as i have a habit of
jumping the gun on occasion. only reason i noticed this is that i'm
perusing the sphinx doc page:

https://www.sphinx-doc.org/en/master/usage/quickstart.html

and looking at the associated source:

https://www.sphinx-doc.org/en/master/_sources/usage/quickstart.rst.txt

and it's highly educational -- that's where i noticed the ":doc:"
variation. i've made note of a bunch of other cool features as well,
stay tuned ...

rday

--8323328-369672489-1604169414=:11009--

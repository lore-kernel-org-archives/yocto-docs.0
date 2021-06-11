Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web09.10989.1623429459591768216
 for <docs@lists.yoctoproject.org>;
 Fri, 11 Jun 2021 09:37:39 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id 11FDC100002;
	Fri, 11 Jun 2021 16:37:36 +0000 (UTC)
Cc: "Tummalapalli, Vineela" <vineela.tummalapalli@intel.com>,
 YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: move release notes to separate document
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <1675A932C413C877.8243@lists.yoctoproject.org>
 <16872EDF3FBC0621.15202@lists.yoctoproject.org>
 <9c29810b-b20f-f752-d914-0f27f779ba2d@bootlin.com>
 <CAP71Wjyy=KM+EFt69rMg5vGJwS6xiG8tsFHfZ_eTZLhjg5vhWA@mail.gmail.com>
 <168736F45421387B.20336@lists.yoctoproject.org>
 <63f24dc7-4fbf-6543-6e1d-8eadfe3cd338@bootlin.com>
 <59c947fa6fc26b984a54b9b781367e41360a713b.camel@linuxfoundation.org>
 <CAP71WjyrOwdZOKrEO=g52hLjeCP_QKHarGzrAWSuwXYCymDX2A@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <2b7deb01-bf74-64a1-c068-620660d80034@bootlin.com>
Date: Fri, 11 Jun 2021 18:37:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAP71WjyrOwdZOKrEO=g52hLjeCP_QKHarGzrAWSuwXYCymDX2A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Nicolas, Richard,

On 6/11/21 11:52 AM, Nicolas Dechesne wrote:
>
> Side question.. should we move the release notes into the docs
> website? now that it's based on Sphinx, it looks like it would be well
> suited..


Interesting idea, to get a much better looking output. This way we could
have hyperlinks, typically to each commit.

Anyway, that's a generated file, right? What would be the workflow?
Generate the release-notes-<version>.rst file and manually add it to the
yocto-docs directory, even though that's a generated file? What's the
script generating the current release notes, so that I can prepare a
version generating .rst instead?

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


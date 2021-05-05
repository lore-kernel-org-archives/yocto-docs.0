Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web12.10544.1620230625510108967
 for <docs@lists.yoctoproject.org>;
 Wed, 05 May 2021 09:03:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 109.208.196.11
Received: from [10.0.0.8] (lfbn-mar-1-666-11.w109-208.abo.wanadoo.fr [109.208.196.11])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 948642000D;
	Wed,  5 May 2021 16:03:43 +0000 (UTC)
Subject: Re: [docs] link to gnome developer example for autotools?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <976b49cc-2ca1-7754-14c-a02451cff517@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <476747ba-82f5-f820-ca37-bde73d3d5dc5@bootlin.com>
Date: Wed, 5 May 2021 18:03:43 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <976b49cc-2ca1-7754-14c-a02451cff517@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Robert,

On 5/1/21 10:02 PM, Robert P. J. Day wrote:
>   this section:
>
> file:///home/rpjday/oe/dist/layers/yocto-docs/documentation/_build/html/sdk-manual/working-projects.html


You meant https://docs.yoctoproject.org/sdk-manual/working-projects.html
(you referred to a local link).

>
> notes:
>
> "For more information on the GNU Autotools workflow, see the same
> example on the GNOME Developer site."
>
>   not sure what "same example" this is referring to, but can someone
> clarify what link can be added here corresponding to the alleged
> example?


I guess the reference is
https://developer.gnome.org/anjuta-build-tutorial/stable/create-autotools.html.en

Indeed, we should provide readers with a direct link instead of
expecting them to find such a page through a search engine.

Actually, this example just adds a little more than what we already
explain. Instead shouldn't we provide links to the original
documentation for the autotools, such as
https://www.gnu.org/software/automake/#documentation for automake and
https://www.gnu.org/software/autoconf/ for autoconf? If we do that, it's
what we already get from the link to
https://en.wikipedia.org/wiki/GNU_Build_System already provided at the
beginning of the section.

If you agree, I vote to remove the note entirely.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web09.16271.1621240627382219885
 for <docs@lists.yoctoproject.org>;
 Mon, 17 May 2021 01:37:08 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.195, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 946A86000B;
	Mon, 17 May 2021 08:36:55 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [RFC 2/3] conf.py: prefer PNG to SVG in EPUB output
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
References: <20210515071219.307241-1-michael.opdenacker@bootlin.com>
 <20210515071219.307241-3-michael.opdenacker@bootlin.com>
 <CAP71Wjy_i6N=V+aKuZJA4U50QxDdWVg4pp4yLXsG2kDyQaaMkQ@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <a940ba06-4631-6f5b-ad31-ebafa3d9edcd@bootlin.com>
Date: Mon, 17 May 2021 10:36:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAP71Wjy_i6N=V+aKuZJA4U50QxDdWVg4pp4yLXsG2kDyQaaMkQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Nicolas,

Thanks for the review!

On 5/17/21 12:29 AM, Nicolas Dechesne wrote:
>
>
> On Sat, May 15, 2021 at 9:13 AM Michael Opdenacker
> <michael.opdenacker@bootlin.com
> <mailto:michael.opdenacker@bootlin.com>> wrote:
>
>     SVG directly included in EPUB output has multiple issues,
>     in particular font size and alignment ones (tested on two
>     EPUB readers).
>
>     Signed-off-by: Michael Opdenacker <michael.opdenacker@bootlin.com
>     <mailto:michael.opdenacker@bootlin.com>>
>     ---
>      documentation/conf.py | 4 ++++
>      1 file changed, 4 insertions(+)
>
>     diff --git a/documentation/conf.py b/documentation/conf.py
>     index 5a2e25f7b2..798a365c7f 100644
>     --- a/documentation/conf.py
>     +++ b/documentation/conf.py
>     @@ -136,3 +136,7 @@ latex_elements = {
>          'passoptionstopackages':
>     '\PassOptionsToPackage{bookmarksdepth=5}{hyperref}',
>          'preamble': '\setcounter{tocdepth}{2}',
>      }
>     +
>     +# Make the EPUB builder prefer PNG to SVG because of issues
>     rendering Inkscape SVG
>     +from sphinx.builders.epub3 import Epub3Builder
>     +Epub3Builder.supported_image_types = ['image/png',
>     'image/svg+xml', 'image/gif', 'image/jpeg']
>
>
> If you concluded svg has issues, should we remove it from this list
> instead?


This definitely makes sense, indeed. I made this change for the next
version I submit.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web11.11164.1622220620190233113
 for <docs@lists.yoctoproject.org>;
 Fri, 28 May 2021 09:50:20 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 4AAB320007;
	Fri, 28 May 2021 16:50:17 +0000 (UTC)
Subject: Re: [docs] [PATCH] docs: replace ``FOO`` by :term:`FOO` where possible
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20210527184117.80067-1-foss@0leil.net>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <891410b6-6708-1f0e-8130-e0e5a8bfbd42@bootlin.com>
Date: Fri, 28 May 2021 18:50:17 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527184117.80067-1-foss@0leil.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

On 5/27/21 8:41 PM, Quentin Schulz wrote:
> If a variable has a glossary entry and some rST files write about those
> variables, it's better to point to the glossary entry instead of just
> highlighting it by surrounding it with two tick quotes.
>
> This was automated by the following python script:
> """
> import re
> from pathlib import Path
>
> with open('objects.inv.txt', 'r') as f:
>     objects = f.readlines()
>
> with open('bitbake-objects.inv.txt', 'r') as f:
>     objects = objects + f.readlines()
>
> re_term = re.compile(r'variables.html#term-([A-Z_0-9]*)')
> terms = []
>
> for obj in objects:
>     match = re_term.search(obj)
>     if match and match.group(1):
>         terms.append(match.group(1))
>
> for rst in Path('.').rglob('*.rst'):
>     with open(rst, 'r') as f:
>         content = "".joing(f.readlines())
>     for term in terms:
>         content = re.sub(r'``({})``(?!.*\s*[~-]+)'.format(term), r':term:`\1`', content)
>
>     with open(rst, 'w') as f:
>         f.write(content)
> """
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>

Looks nice. By the way, what about making a similar script that would
find documented variables that are no longer supported in the current
releases?

I'm curious about how many obsolete variables we're still documenting...

Just an idea when you have time... Or when I have time ;-)

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


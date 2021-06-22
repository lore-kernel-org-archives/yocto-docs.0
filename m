Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web11.5569.1624346537036043509
 for <docs@lists.yoctoproject.org>;
 Tue, 22 Jun 2021 00:22:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id 417F5FF80F;
	Tue, 22 Jun 2021 07:22:14 +0000 (UTC)
Subject: Re: [docs] [PATCH] docs: replace remaining ``FOO`` by :term:`FOO`
To: Quentin Schulz <foss@0leil.net>, docs@lists.yoctoproject.org
References: <20210619070735.3998-1-foss@0leil.net>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <77c62c9c-a8a5-1148-5977-d9cc66fac098@bootlin.com>
Date: Tue, 22 Jun 2021 09:22:14 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210619070735.3998-1-foss@0leil.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

Thanks for the new patch!

On 6/19/21 9:07 AM, Quentin Schulz wrote:
> A few occurences appeared between the time the original patch was sent
> and it was applied, this fixes it.
>
> Also, the original patch didn't take into account lowercase terms, this
> is now fixed, see module_autoload for example.
>
> Finally, as is often the case with regexp, there was a typo in it that
> didn't make it match as much as it should have.
>
> The script that is used to do the replacement of ``FOO`` by :term:`FOO`
> is the following Python code:
>
> import re
> from pathlib import Path
> from runpy import run_module
> import contextlib
> import io
> import sys
>
> re_term = re.compile(r'variables.html#term-([a-zA-Z_0-9]*)')
> terms = []
> new_terms = set()
>
> with contextlib.redirect_stdout(io.StringIO()) as f:
>     run_module('sphinx.ext.intersphinx', run_name='__main__')
>
> objects = f.getvalue()
>
> match = re_term.search(objects)
> while match:
>     if match.group(1):
>         terms.append(match.group(1))
>     match = re_term.search(objects, match.end())
>
> for rst in Path('.').rglob('*.rst'):
>     with open(rst, 'r') as f:
>         content = "".join(f.readlines())
>     for term in terms:
>         content = re.sub(r'``({})``(?!.*\s+[~=-]{{{:d},}})'.format(term, len(term)), r':term:`\1`', content)
>
>     with open(rst, 'w') as f:
>         f.write(content)
>
> This script takes one argument as input: an objects.inv. Bitbake's can
> be gotten from https://docs.yoctoproject.org/bitbake/objects.inv. The
> objetcs.inv from the current git repo can be gotten from
> documentation/_build/html/objetcs.inv after running `make html`.
>
> Note that this excludes from replacement terms that appear in section
> titles as it requires refs to be changed too. This can be automated too
> if need be but right now it looks a bit confusing to have an anchor link
> (for sections) also have a term/reference link in it. I am not sure this
> is desired today.
>
> This is the result of two runs of the aforementioned script, once with
> Bitbake objects.inv and once with this repo's.
>
> Fixes: ba49d9babfcb "docs: replace ``FOO`` by :term:`FOO` where possible"
>
> Signed-off-by: Quentin Schulz <foss@0leil.net>


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Merged into "master-next". Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


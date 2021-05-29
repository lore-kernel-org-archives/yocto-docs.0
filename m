Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web09.21372.1622298996645694644
 for <docs@lists.yoctoproject.org>;
 Sat, 29 May 2021 07:36:37 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.232, mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay12.mail.gandi.net (Postfix) with ESMTPA id 8CB28200005;
	Sat, 29 May 2021 14:36:34 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 29 May 2021 16:36:34 +0200
From: "Quentin Schulz" <foss@0leil.net>
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] docs: replace ``FOO`` by :term:`FOO` where possible
In-Reply-To: <891410b6-6708-1f0e-8130-e0e5a8bfbd42@bootlin.com>
References: <20210527184117.80067-1-foss@0leil.net>
 <891410b6-6708-1f0e-8130-e0e5a8bfbd42@bootlin.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <545bc8c70c6f596cac20567918db862f@0leil.net>
X-Sender: foss@0leil.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Hi Michael,

On 2021-05-28 18:50, Michael Opdenacker wrote:
> Hi Quentin,
> 
> On 5/27/21 8:41 PM, Quentin Schulz wrote:
>> If a variable has a glossary entry and some rST files write about 
>> those
>> variables, it's better to point to the glossary entry instead of just
>> highlighting it by surrounding it with two tick quotes.
>> 
>> This was automated by the following python script:
>> """
>> import re
>> from pathlib import Path
>> 
>> with open('objects.inv.txt', 'r') as f:
>>     objects = f.readlines()
>> 
>> with open('bitbake-objects.inv.txt', 'r') as f:
>>     objects = objects + f.readlines()
>> 
>> re_term = re.compile(r'variables.html#term-([A-Z_0-9]*)')
>> terms = []
>> 
>> for obj in objects:
>>     match = re_term.search(obj)
>>     if match and match.group(1):
>>         terms.append(match.group(1))
>> 
>> for rst in Path('.').rglob('*.rst'):
>>     with open(rst, 'r') as f:
>>         content = "".joing(f.readlines())
>>     for term in terms:
>>         content = re.sub(r'``({})``(?!.*\s*[~-]+)'.format(term), 
>> r':term:`\1`', content)
>> 
>>     with open(rst, 'w') as f:
>>         f.write(content)
>> """
>> 
>> Signed-off-by: Quentin Schulz <foss@0leil.net>
> 
> Looks nice. By the way, what about making a similar script that would
> find documented variables that are no longer supported in the current
> releases?
> 
> I'm curious about how many obsolete variables we're still 
> documenting...
> 
> Just an idea when you have time... Or when I have time ;-)
> 

 From within poky directory:

git grep -hoP '^   :term:`\K\w+(?=`)' 
documentation/ref-manual/variables.rst 
bitbake/doc/bitbake-user-manual/bitbake-user-manual-ref-variables.rst | 
xargs -I{} sh -c "grep -Rq --exclude-dir=documentation --include='*.py' 
--include='*.conf' --include='*.bbclass' --include='*.bb' 
--include='*.bbappend' --include='*.inc' -w -E 
{}'_*(_[a-z]+[0-9a-z]*[a-z]+)*' || echo {}"

which looks for all words fulfilling the following criteria:
  - should start with an entry from the glossary (e.g. :term:`DEPENDS` 
the word shall start with DEPENDS
  - may be followed by an underscore only (to match RDEPENDS_${* and 
d.getVar('RDEPENDS_')
  - may be followed by _alllowercase-digit (to match overrides, e.g. 
DEFAULTTUNE_virtclass-multilib-lib32)

The command returns the following:
BB_SETSCENE_VERIFY_FUNCTION2
BBVERSIONS

Aaaaaaand I should have checked BBVERSIONS for my slides about OVERRIDES 
at last YP summit because it indeed does not exist anymore since... 
November 2016 
(https://git.openembedded.org/bitbake/commit/?id=0bb188f01e396052b127e170a25246d79a6d6741).

BB_SETSCENE_VERIFY_FUNCTION2 has been removed in 3.0 (zeus) release, 
c.f. 
https://git.openembedded.org/bitbake/commit/?id=5deaa5df730a8a846f3192b4a639b7a2a72c1b71

I'll send patches to the bitbake and yocto-docs ML ASAP.

I've tested by adding :term:`TEST123TEST` and :term:`MACH` to the 
variables.rst file.

Then, I added the following to any file matching the include patterns of 
the grep command above:
MACH = "plop"
${MACH}
d.getVar('MACH')
MACH_plop
MACH_${plop}-plep
IMACH_${plop}-plep

All match when running the grep command only (without the -q option) 
except the last one in the list (to check that MACH term is not found by 
grep in e.g. MACHINE).

TEST123TEST is reported as not being used which is correct.

I also had the idea of trying to guess which Bitbake variables are 
highlighted but not documented yet. This will obviously require 
cherry-picking because e.g. README is matched but there's definitely 
nothing to add in the glossary for that :)

Cheers,
Quentin

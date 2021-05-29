Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.21466.1622300661227128038
 for <docs@lists.yoctoproject.org>;
 Sat, 29 May 2021 08:04:21 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.196, mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPA id E6BEAE0003;
	Sat, 29 May 2021 15:04:18 +0000 (UTC)
MIME-Version: 1.0
Date: Sat, 29 May 2021 17:04:18 +0200
From: "Quentin Schulz" <foss@0leil.net>
To: Nicolas Dechesne <nicolas.dechesne@linaro.org>
Cc: Michael Opdenacker <michael.opdenacker@bootlin.com>, YP docs mailing
 list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] documentation: Makefile: turn warnings into errors by default
In-Reply-To: <CAP71Wjw6VH_wrEC+b3ps8CBPhQM=TDRiPtYS3=XyP4Rq1j57uA@mail.gmail.com>
References: <20210527183150.79497-1-foss@0leil.net>
 <08b82e87-ec3f-e713-8e0e-cf739b75efdd@bootlin.com>
 <CAP71Wjw6VH_wrEC+b3ps8CBPhQM=TDRiPtYS3=XyP4Rq1j57uA@mail.gmail.com>
User-Agent: Roundcube Webmail/1.4.11
Message-ID: <e7954a7e45ba15362ddff609ee0cc0d4@0leil.net>
X-Sender: foss@0leil.net
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit

Michael, Nicolas,

On 2021-05-28 10:40, Nicolas Dechesne wrote:
> On Fri, May 28, 2021 at 10:35 AM Michael Opdenacker
> <michael.opdenacker@bootlin.com> wrote:
> 
>> Hi Quentin,
>> 
>> On 5/27/21 8:31 PM, Quentin Schulz wrote:
>>> -W is for turning warnings into errors, --keep-going to make sure
>> the
>>> whole documentation is built and all warnings will be printed
>> before
>>> failing.
>>> 
>>> Since there's currently no warning, it's time to introduce it!
>>> 
>>> Signed-off-by: Quentin Schulz <foss@0leil.net>
>>> ---
>>> documentation/Makefile | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>> 
>>> diff --git a/documentation/Makefile b/documentation/Makefile
>>> index d40f390e2..996f01b7d 100644
>>> --- a/documentation/Makefile
>>> +++ b/documentation/Makefile
>>> @@ -3,7 +3,7 @@
>>> 
>>> # You can set these variables from the command line, and also
>>> # from the environment for the first two.
>>> -SPHINXOPTS    ?= -j auto
>>> +SPHINXOPTS    ?= -W --keep-going -j auto
>>> SPHINXBUILD   ?= sphinx-build
>>> SOURCEDIR     = .
>>> BUILDDIR      = _build
>> 
>> Thanks for the nice improvement. I tested that it builds the "html"
>> and
>> "latexpdf" targets just fine, but it aborts with "epub" as follows:
>> 
>> writing mimetype file...
>> writing META-INF/container.xml file...
>> writing content.opf file...
>> WARNING: unknown mimetype for .poky.yaml.cache, ignoring
>> writing nav.xhtml file...
>> writing toc.ncx file...
>> writing TheYoctoProject.epub file...
>> build finished with problems, 1 warning.
>> make: *** [Makefile:35: epub] Error 1
>> 
>> If I understood correctly, this happens because the .yaml file is
>> not
>> understood by Sphinx, as explained on
>> https://github.com/sphinx-doc/sphinx/issues/3214. However, I don't
>> understand why this only happens with "epub" output.
> 
> interesting.. I tested it yesterday, and it worked for me... So I
> tried again today, and realized i was using Sphinx 3.3.1, I updated to
> 4.0.2 and now it fails too..
> 

FWIW, this happens only for the 2+ builds, the first one works just 
fine.

IIRC, I was using Sphinx 3.4.1 or 3.4.3, for sure not 4.x.

Since we're not really supporting epub right now, does it make sense to 
fix it in this patch (or just before this patch) rather than in 
Michael's patch series (when it'll come).

No objection to me doing it right now, not sure it makes the most sense 
that's it :)

>> A workaround is to disable warnings for unknown project files:
>> 
>> diff --git a/documentation/conf.py b/documentation/conf.py
>> index 5a2e25f7b2..6c6458fed7 100644
>> --- a/documentation/conf.py
>> +++ b/documentation/conf.py
>> @@ -92,6 +92,9 @@ intersphinx_mapping = {
>> 'bitbake': ('https://docs.yoctoproject.org/bitbake/', None)
>> }
>> 
>> +# Suppress "WARNING: unknown mimetype for ..."
>> +suppress_warnings = ['epub.unknown_project_files']
>> +
>> # -- Options for HTML output
>> -------------------------------------------------
>> 
>> # The theme to use for HTML and HTML Help pages.  See the
>> documentation for
>> 
>> Would this be acceptable? I hope so, because I believe having your
>> changes would be useful.
>> 

There's actually a better setting for this: 
https://www.sphinx-doc.org/en/master/usage/configuration.html#confval-epub_exclude_files

+ epub_exclude_files = ['.poky.yaml.cache']

in conf.py

Just add the files that are problematic in there :)

Cheers,
Quentin

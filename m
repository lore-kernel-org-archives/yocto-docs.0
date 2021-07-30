Received: from relay1-d.mail.gandi.net (relay1-d.mail.gandi.net [217.70.183.193])
 by mx.groups.io with SMTP id smtpd.web09.21656.1627637264996313490
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Jul 2021 02:27:45 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.193, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay1-d.mail.gandi.net (Postfix) with ESMTPSA id 7D09B240002;
	Fri, 30 Jul 2021 09:27:42 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] migration-guides: Add start of 3.4 guide with override migration notes
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>
References: <20210729220945.3333837-1-richard.purdie@linuxfoundation.org>
 <20210730081618.bgwfpsbtzh7vcfuf@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <8e685756-d678-aa16-330c-fcd6a6c8f97d@bootlin.com>
Date: Fri, 30 Jul 2021 11:27:41 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210730081618.bgwfpsbtzh7vcfuf@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Richard, thanks for the patch
Quentin, thanks for the review

I'm taking care of preparing a V2 to reduce the load on Richard's
shoulders...

On 7/30/21 10:16 AM, Quentin Schulz wrote:
> Hi Richard,
>
> On Thu, Jul 29, 2021 at 11:09:45PM +0100, Richard Purdie wrote:
>> Signed-off-by: Richard Purdie <richard.purdie@linuxfoundation.org>
>> ---
>>  documentation/migration-guides/index.rst      |  1 +
>>  .../migration-guides/migration-3.4.rst        | 72 +++++++++++++++++++
>>  2 files changed, 73 insertions(+)
>>  create mode 100644 documentation/migration-guides/migration-3.4.rst
>>
>> diff --git a/documentation/migration-guides/index.rst b/documentation/migration-guides/index.rst
>> index 6304e6318..287b55319 100644
>> --- a/documentation/migration-guides/index.rst
>> +++ b/documentation/migration-guides/index.rst
>> @@ -12,6 +12,7 @@ to move to one release of the Yocto Project from the previous one.
>>  .. toctree::
>>  
>>     migration-general
>> +   migration-3.4
>>     migration-3.3
>>     migration-3.2
>>     migration-3.1
>> diff --git a/documentation/migration-guides/migration-3.4.rst b/documentation/migration-guides/migration-3.4.rst
>> new file mode 100644
>> index 000000000..45ce38cd6
>> --- /dev/null
>> +++ b/documentation/migration-guides/migration-3.4.rst
>> @@ -0,0 +1,72 @@
>> +Release 3.4 (honister)
>> +======================
>> +
>> +This section provides migration information for moving to the Yocto
>> +Project 3.4 Release (codename "honister") from the prior release.
>> +
>> +Override syntax changes
>> +-----------------------
>> +
>> +This release requires changes to the metadata to indicate where overrides are
>> +being used in variable key names. This is done with the ":" character replacing
>> +the use of "_" previously. This means that an entry like::
>> +
>> +   SRC_URI_qemux86 = "file://somefile"
>> +
>> +becomes::
>> +
>> +   SRC_URI:qemux86 = " file://somefile"
>> +
> Is the leading space here on purpose?


Assuming that's a typo. Fixed.

>
>> +since qemux86 is an override. This applies to any use of override syntax so::
>> +
> I'm pondering whether we should quote or tick quote qemux86?


I'll set it to ``qemux86`` but I plan to write some documentation coding
style so that we know which conventions to follow.

>
>> +   SRC_URI_append = " file://somefile"
>> +   SRC_URI_append_qemux86 = " file://somefile2"
>> +   SRC_URI_remove_qemux86-64 = " file://somefile3"
>> +   SRC_URI_prepend_qemuarm = "file://somefile4 "
>> +   FILES_${PN}-ptest = "${bindir}/xyz"
>> +   IMAGE_CMD_tar = "tar"
>> +   BASE_LIB_tune-coretexa76 = "lib"
> s/BASE_LIB_tune-coretexa76/BASE_LIB_tune-cortexa76/


Fixed.

>> +   SRCREV:pn-bash = "abc"
>> +   BB_TASK_NICE_LEVEL:task-testimage = '0'
>> +
>> +This also applies to variable queries to the datastore, for example using getVar 
>> +and similar so d.getVar("RDEPENDS_${PN}") becomes d.getVar("RDEPENDS:${PN}").
>> +
> Probably would benefit from tick quotes?

Done
>
>> +Whilst some of these are fairly obvious such as MACHINE and DISTRO overrides, some
> s/MACHINE/:term:`MACHINE`/
>
> Ditto for DISTRO.
>
>> +are less obvious, for example the packaging variables such as RDEPENDS, FILES and 
> Ditto for RDEPENDS and FILES.

Fixed
>
>> +so on taking package names (e.g. ${PN}, ${PN}-ptest) as overrides. These overrides 
> Tick quotes for ${PN}?
>
>> +are not always applies in OVERRIDES but applied conditionally in specific contexts
> s/OVERRIDES/:term:`OVERRIDES`/


All fixed!

>
> s/applies// ?

I first felt like writing "applied" instead, but this makes sense too.
The sentence is now:

"These overrides are not always in
:term:`OVERRIDES` but applied conditionally in specific contexts
such as packaging"

>
>> +such as packaging. The task-<taskname> is another context specific override, the 
> Tick quoting task-<taskname>?


Yes

>
>> +context being specific tasks in that case. Tune overrides are another specialist
> s/specialist/special/ ?

Make sense
>
>> +case where some code does use them as overrides but some does not. We plan to try
>> +and make the tune code use overrides more consistently in the future.
>> +
>> +To help with migration of layers there is a script in OE-Core. Once configured
> Add a link to this script whose text is "a script in OE-Core"? (I know
> it's mentioned below).
>
>> +with the overrides used by a layer, this can be run as::
>> +
>> +   <oe-core>/scripts/contrib/convert-overrides.py <layerdir>


I'm not sure about what you're proposing here. I believe we currently
don't put hyperlinks to source code in the documentation, we just
mention the file paths. We could though.

>> +
>> +Please read the notes in the script as it isn't entirely automatic and it isn't
>> +expected to handle every case. In particular, it needs to be told which overrides
>> +the layer uses (usually machine and distro names/overrides) and the result should
>> +be carefully checked since it can be a little enthusiastic and will convert
>> +references to "_append", "_remove" and "_prepend" in function and variables names.
>> +
> Pondering whether the one (or two) paragpraphs above should be in a
> ..note section to highlight it.


Good idea, I put the first paragraph in a note. I didn't want the second
paragraph to be in the same note. This way it's more visible IMHO.

I'll submit my V2 soon.

Thanks again,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


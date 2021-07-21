Received: from relay12.mail.gandi.net (relay12.mail.gandi.net [217.70.178.232])
 by mx.groups.io with SMTP id smtpd.web08.281.1626881485734845881
 for <docs@lists.yoctoproject.org>;
 Wed, 21 Jul 2021 08:31:26 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.232, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay12.mail.gandi.net (Postfix) with ESMTPSA id 2D3B020000A;
	Wed, 21 Jul 2021 15:31:22 +0000 (UTC)
Subject: Re: [docs] [PATCH] kickstart: update busybox note regarding PARTUUID
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: Ross Burton <ross@burtonini.com>, docs@lists.yoctoproject.org
References: <20210721125025.3996595-1-ross.burton@arm.com>
 <1693D42FF18C1F82.16442@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <fb906e49-40dc-bad7-eac4-9b01c0d195dc@bootlin.com>
Date: Wed, 21 Jul 2021 17:31:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <1693D42FF18C1F82.16442@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi again,

On 7/21/21 4:19 PM, Michael Opdenacker wrote:
> Hi Ross,
>
> Thank you for this patch!
> See my comments and questions below...
>
> On 7/21/21 2:50 PM, Ross Burton wrote:
>> As of oe-core c996cabf the default BusyBox configuration supports
>> PARTUUID, so update the note to reflect this.
>>
>> Signed-off-by: Ross Burton <ross.burton@arm.com>
>> ---
>>  documentation/ref-manual/kickstart.rst | 5 +++--
>>  1 file changed, 3 insertions(+), 2 deletions(-)
>>
>> diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
>> index fc723ccbe..9de3f763d 100644
>> --- a/documentation/ref-manual/kickstart.rst
>> +++ b/documentation/ref-manual/kickstart.rst
>> @@ -54,8 +54,9 @@ must also provide one of the ``--ondrive``, ``--ondisk``, or
>>  .. note::
>>  
>>     The mount program must understand the PARTUUID syntax you use with
>> -   ``--use-uuid`` and non-root *mountpoint*, including swap. The BusyBox
>> -   versions of these application are currently excluded.
>> +   ``--use-uuid`` and non-root *mountpoint*, including swap. The default
>> +   configuration of BusyBox in OpenEmbedded support this, but this may
>> +   be disabled in custom configurations.
> s/support/supports/ ... but I can update this by myself.
>
> Written this way (not your fault, unless you wrote the initial text
> too!), this suggests that "mount" has a "--use-uuid" option, but I can't
> seem to use it.
>
> Here's what works for me:
> mount UUID=675e2a50-fd3b-43b7-aede-6714e2404070 /mnt/mount/
>
> Reading further, I know understand that this corresponds to Wic's
> option. Could we say "... you use with Wic's ``--use-uuid`` option for
> non-root mountpoints" instead?
>
> I'm proposing "for" instead of "and" here because I first believed the
> text was talking about the "mountpoints" BusyBox command run as a
> non-root user. I may be a little twisted, but I think that would be less
> confusing.


Actually, the existing text is worse than this, as I checked that
"--use-uuid" doesn't take any argument. Instead "--fsuuid" and "--uuid" do.

After further digging, I realize that most of the text in this document
comes from Wic's help usage in oe-core's scripts/lib/wic/help.py .
That's where the text should be fixed (and may already be fixed in a
pending patch).

That's not very satisfactory to maintain a duplicate copy in the
documentation that will always tend to be out of date. I already saw
that too with the run-qemu command options.

I see three possible solutions...

 1. Go on using a copy, but use a verbatim copy of "wic help kickstart",
    being more explicit about where the text comes from. A good example
    is devtool's documentation in the reference manual:
    https://docs.yoctoproject.org/ref-manual/devtool-reference.html
 2. In the reference manual, link to the help text output of the commands
 3. Automatically include the help text from the sources (or from the
    output of commands) in the reference documentation.

1. Seems the easiest way to go for the moment, but if someone has a good
idea going further that would avoid duplicating command output, this
would be great! Anyway, I'd rather wait for scripts/lib/wic/help.py to
be updated (with correct contents) before adding a different change to
the reference manual.

What do you think?

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


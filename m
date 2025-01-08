Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3FDDAE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 15:40:52 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.22167.1736350848434466939
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Jan 2025 07:40:48 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 508FcivI009405;
	Wed, 8 Jan 2025 09:38:44 -0600
Received: from [192.168.2.133] ([192.168.2.133])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 508FchSn026831;
	Wed, 8 Jan 2025 09:38:43 -0600
Message-ID: <14eb7196-e071-4d0a-b918-0201600c04d7@kernel.crashing.org>
Date: Wed, 8 Jan 2025 09:38:43 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: Best practices documentation for multiconfigs
Content-Language: en-US
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Richard Purdie <richard.purdie@linuxfoundation.org>
References: <cb8cda4b-4b71-4896-b355-d628336b11a4@kernel.crashing.org>
 <D6WSSTWDW44E.3VZKMQHM8HZLN@bootlin.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <D6WSSTWDW44E.3VZKMQHM8HZLN@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Jan 2025 15:40:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6067



On 1/8/25 9:31 AM, Antonin Godard wrote:
> Hi Mark,
> 
> Thanks for this. I can help with formatting as well as where to put this bit of
> documentation.
> 
> I already created a bug for this, you can add yourself to CC if you want to
> track it: https://bugzilla.yoctoproject.org/show_bug.cgi?id=15709.
> 
> First thought: compared to what we currently have [1], your doc seems to bring
> better details on multiconfigs. I'm thinking we could merge both to have a
> complete document on multiconfigs (and also make it its own document instead of
> a "Building" subsection).

Ultimately I think multiconfigs and how to use them is a large enough long-term 
topic that we will need to expand on this and figure out how to tie it into the 
(normal) single configuration.

I've struggled to explain this to people in my organization in a way that isn't 
horribly confusing.  My go to is:

Each configuration is effectively it's own, just as if you have multiple build 
directories each with their own configuration.  The complications [these best 
practices] come into play when we need to build something in one configuration 
and use it in another, which pretty much is always a requirement for a few 
select components [firmwares].

I then usually introduce this topic by walking through configuring individual 
build directories, building the components manually... and then "convert" it to 
a multiconfig.

Long term, we may want to do something similar in our own YP manuals, but I'll 
leave that to others to decide if that is really a good idea or not.

--Mark

> Other comments below.
> 
> [1]: https://docs.yoctoproject.org/dev-manual/building.html#building-images-for-multiple-targets-using-multiple-configurations
> 
> On Wed Jan 8, 2025 at 12:07 AM CET, Mark Hatle wrote:
>> I was talking to Richard on IRC and we think that we need to start collecting
>> and documenting examples and/or best practices for multiconfig usage.  Below is
>> my question attempt at starting this.  Hopefully we can expand this to something
>> generally useful.  What follows is a bit rough, and will likely need editing...
>>
>>
>> A common use for multiconfig is to use the default configuration as the regular
>> Linux build, while one or more multiconfigs can be used to build special
>> components (often baremetal firmware.)  Enabling this workflow requires us to do
>> three primary actions:
>>
>>     1) Configure the multiconfig builds
>>     2) Use multiconfig dependencies to trigger builds of necessary components
>>     3) Pick up the output of the multiconfig build and bring it into a different
>> config
>>
>> In order to successfully do the above, the following could be considered to be
>> best practices.
>>
>> Configuration:
>>
>> All of the (user) configuration starts with the local.conf file.  A default
>> value of:
>>
>> TMPDIR ?= "${TOPDIR}/tmp"
>>
>> is used to control the location for temporary build items, where components are
>> stored and built components are deployed.  For the deployed items the settings are:
>>
>> DEPLOY_DIR ?= "${TMPDIR}/deploy"
>> DEPLOY_DIR_IMAGE ?= "${DEPLOY_DIR}/images/${MACHINE}"
>>
>>
>> Each multiconfig requires a separate multiconfig configuration file.
>>
>> See:
>> https://docs.yoctoproject.org/dev-manual/building.html#building-images-for-multiple-targets-using-multiple-configurations
>>
>>
>> At a minimum a different TMPDIR is required for each multiconfig.  As a best
>> practice, instead of defining each TMPDIR separately, if they are defined as an
>> append (.= operation) with an expected format, later steps can use this
>> information to find the output of the build.  For example:
>>
>> TMPDIR .= "-${BB_CURRENT_MC}"
>>
>>
>> This also has the side effect that if the user changes the default TMPDIR
>> location in local.conf, all of the multiconfigs will follow with the same change
>> automatically.
>>
>>
>> For example:
>>
>> conf/multiconfig/baremetal-firmware.conf:
>>
>> TMPDIR .= "-${BB_CURRENT_MC}"
> 
> I assumed the `:append` override to be better practice in configuration files.
> 
>> TCLIBC = "newlib"
>>
>>
>> and a custom recipe called 'my-firmware.bb' that uses newlib to build baremetal
>> firmware for the device.  my-firmware.bb should define a do_deploy function that
>> deploys the baremetal firmware to ${DEPLOYDIR} with a specific name, such as
>> "my-firmware.elf".
>>
>>
>> Building:
>>
>> Using an 'mcdepend' a recipe in one multiconfig can trigger the build in another
>> multiconfig, such as:
>>
>>
>> my-special-firmware.bb:
>>
>> do_compile[mcdepends] = "mc::baremetal-firmware:my-firmware:do_deploy"
>>
>>
>> The above will ensure when do_compile is triggered, it further triggers the
>> multiconfig build which will deploy the built firmware.
> 
> Yes and actually this is lacking in the current documentation: this is the
> way to add a dependency on a multiconfig from the default ("" empty string)
> config, which is a common use-case of multiconfigs I believe.
> 
>>
>>
>>
>> Using the output of the build:
>>
>> However, just because we've built the item using mcdepends, we need to use the
>> output in some way.   We can make a series of assumptions, based on the default
>> Yocto Project variables in order to get the binary for packaging.
>>
>> Adding a do_install task to the example above:
>>
>> my-special-firmware.bb:
>>
>> do_install() {
>>      install -Dm 0644 ${TMPDIR}-baremetal-firmware/deploy/my-firmware.elf
>> ${D}/lib/firmware/my-firmware.elf
>> }
> 
> In my-firmware.bb, is deploying to DEPLOYDIR (defined as "${WORKDIR}/deploy-my-firmware"
> for the recipe) enough for my-special-firmware to pick up the firmware in
> baremetal-firmware's DEPLOY_DIR ("${TMPDIR}-baremetal-firmware/deploy") here?
> Shouldn't it pick it up in baremetal-firmware's DEPLOY_DIR_IMAGE instead?
> 
>>
>>
>> Doing the above will allow the firmware binary to be transfered and packaged
>> into the Linux context and rootfs.  However, this only works if we are careful
>> to not affect TMPDIR outside of specific places, and we use the default
>> DEPLOY_DIR (or other) deployment variables.
>>
>>
>> Suggested best practices:
>>
>> TMPDIR (other then the default set in bitbake.conf) is only set in local.conf by
>> the user.  This means that we should NOT manipulate TMPDIR in any way within the
>> machine or distro .conf files.
>>
>> A multiconfig must specify a TMPDIR, and should specify it by appending the
>> multiconfig name via "-${BB_CURRENT_MC}".
>>
>> All recipes should following the best practices for do_install and do_deploy.
>>
>> Recipes that are used to transfer the output from a multiconfig target should
>> use task[mcdepends] to trigger the build of the component, and then transfer the
>> item to the current configuration in do_install or do_deploy, assuming the value
>> of the deployed item based on the TMPDIR.
>>
>> Suggested that the dependency and path are specific in a variable to make it
>> easier to adjust as assumptions change, or the user has specific environment needs.
> 
> Not sure I got this sentence, could you explain what you meant here?
> 
>>
>> (we should have some proper examples for this.... i.e.)
>>
>> conf/multiconfig/baremetal-firmware.conf:
>>
>> TMPDIR .= "-${BB_CURRENT_MC}"
>> TCLIBC = "newlib"
>>
>> recipes-firmware/firmware/my-firmware.bb:
>>
>> do_compile() {
>>      echo "testing" > ${B}/my-firmware.bin
>>
>> do_install() {
>>      install -mD 0644 ${B}/my-firmware.bin ${D}/lib/firmware/my-firmware.bin
>> }
>>
>> do_deploy() {
>>      install -mD 0644 ${B}/my-firmware.bin ${DEPLOYDIR}/my-firmware.bin
>> }
>>
>> recipes-firmware/firmware/my-special-firmware.bb:
>>
>> INHIBIT_DEFAULT_DEPS = "1"
>>
>> FIRMWARE_DEPENDS   ??= ""
>> FIRMWARE_MCDEPENDS ??= "mc::baremetal-firmware:my-firmware:do_deploy"
>> FIRMWARE_FILE      ??= "${TMPDIR}-baremetal-firmware/deploy/my-firmware.elf"
>> FIRMWARE_FILE[vardepsexclude] += "TMPDIR"
>>
>> do_install() {
>>       if [ ! -e ${FIRMWARE_FILE} ]; then
>>           echo "Unable to find FIRMWARE_FILE (${FIRMWARE_FILE})"
> 
> Suggestion: "bberror" for visibility?
> 
>>           exit 1
>>       fi
>>
>>       install -Dm 0644 ${FIRMWARE_FILE} ${D}/lib/firmware/${FIRMWARE_FILE}
>> }
>>
>> do_deploy() {
>>       if [ ! -e ${FIRMWARE_FILE} ]; then
>>           echo "Unable to find FIRMWARE_FILE (${FIRMWARE_FILE})"
>>           exit 1
>>       fi
>>
>>       install -Dm 0644 ${FIRMWARE_FILE} ${DEPLOYDIR}/${FIRMWARE_FILE}
>> }
> 
> 
> Antonin
> 


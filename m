Return-Path: <mark.hatle@kernel.crashing.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C3BAE77188
	for <webhook@archiver.kernel.org>; Wed,  8 Jan 2025 15:34:52 +0000 (UTC)
Received: from gate.crashing.org (gate.crashing.org [63.228.1.57])
 by mx.groups.io with SMTP id smtpd.web10.22008.1736350488653960189
 for <docs@lists.yoctoproject.org>;
 Wed, 08 Jan 2025 07:34:49 -0800
Authentication-Results: mx.groups.io;
 dkim=none (message not signed); spf=pass (domain: kernel.crashing.org, ip: 63.228.1.57, mailfrom: mark.hatle@kernel.crashing.org)
Received: from kernel.crashing.org (70-99-78-136.nuveramail.net [70.99.78.136] (may be forged))
	by gate.crashing.org (8.14.1/8.14.1) with ESMTP id 508FYkGV009137
	for <docs@lists.yoctoproject.org>; Wed, 8 Jan 2025 09:34:46 -0600
Received: from [192.168.2.133] ([192.168.2.133])
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 508FYisH026760
	for <docs@lists.yoctoproject.org>; Wed, 8 Jan 2025 09:34:46 -0600
Message-ID: <39d815da-1f48-4822-a1c2-1d8762ab7989@kernel.crashing.org>
Date: Wed, 8 Jan 2025 09:34:44 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] Best practices documentation for multiconfigs
Content-Language: en-US
To: docs@lists.yoctoproject.org
References: <cb8cda4b-4b71-4896-b355-d628336b11a4@kernel.crashing.org>
 <CAJdd5GZY6-QwiJQM1KjQN1=GpSL_po4ay_hahvx4+Miz59vJVg@mail.gmail.com>
From: Mark Hatle <mark.hatle@kernel.crashing.org>
In-Reply-To: <CAJdd5GZY6-QwiJQM1KjQN1=GpSL_po4ay_hahvx4+Miz59vJVg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by gate.crashing.org id 508FYkGV009137
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 08 Jan 2025 15:34:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6066



On 1/7/25 5:37 PM, Joshua Watt via lists.yoctoproject.org wrote:
> This seems good to me and is inline with how we use multiconfig
>=20
> FWIW, we also use "inter-multiconfig" dependencies also (where one
> multiconfig pulls in deployed files from another), but I don't think
> anything in the proposal prevents that from working.

I think the key with this, we need to document a _good_ way to use files =
from=20
one multiconfig build in another.  That was really the problem I was tryi=
ng to=20
lay out below, the key being that if TMPDIR is not stable (i.e. not modif=
ied by=20
machine.conf or distro.conf) it becomes nearly impossible to automate thi=
s for a=20
general/shared layer type case.

So explaining to people how to configure this, how to deploy the files, a=
nd then=20
how to use them is really vital for people to be able to use multiconfigs.

As an aside, I've also moved to putting the BBMULTICONFIG into my machine=
.conf=20
files, because ultimately to build the machine I need the multiconfig to =
build=20
my firmware.  So we end up with something like:

(using the example below)

my-machine.conf:

BBMULTICONFIG +=3D "baremetal-firmware"

FIRMWARE_DEPENDS   =3D ""
FIRMWARE_MCDEPENDS =3D "mc::baremetal-firmware:my-firmware:do_deploy"
FIRMWARE_FILE      =3D "${TMPDIR}-baremetal-firmware/deploy/my-firmware.e=
lf"

...

(this points out a bug in the example below, I've added it inline)

This way the user can just do MACHINE=3Dmy-machine bitbake core-image-min=
imal and=20
they get all of the multiconfig, and other settings automatically.

I'm not sure we want to suggest this behavior generically, but it might b=
e a=20
reasonable follow on to this.


(Note I specify both DEPENDS on MCDEPENDS in these examples because there=
 are=20
cases where the user might want to provide the binary itself via a recipe=
 in the=20
current context, and this allows a common packaging recipe to handle this=
=20
behavior.  Maybe that should be removed from the example as I don't reall=
y=20
explain it.)


> On Tue, Jan 7, 2025 at 4:09=E2=80=AFPM Mark Hatle via lists.yoctoprojec=
t.org
> <mark.hatle=3Dkernel.crashing.org@lists.yoctoproject.org> wrote:
>>
>> I was talking to Richard on IRC and we think that we need to start col=
lecting
>> and documenting examples and/or best practices for multiconfig usage. =
 Below is
>> my question attempt at starting this.  Hopefully we can expand this to=
 something
>> generally useful.  What follows is a bit rough, and will likely need e=
diting...
>>
>>
>> A common use for multiconfig is to use the default configuration as th=
e regular
>> Linux build, while one or more multiconfigs can be used to build speci=
al
>> components (often baremetal firmware.)  Enabling this workflow require=
s us to do
>> three primary actions:
>>
>>     1) Configure the multiconfig builds
>>     2) Use multiconfig dependencies to trigger builds of necessary com=
ponents
>>     3) Pick up the output of the multiconfig build and bring it into a=
 different
>> config
>>
>> In order to successfully do the above, the following could be consider=
ed to be
>> best practices.
>>
>> Configuration:
>>
>> All of the (user) configuration starts with the local.conf file.  A de=
fault
>> value of:
>>
>> TMPDIR ?=3D "${TOPDIR}/tmp"
>>
>> is used to control the location for temporary build items, where compo=
nents are
>> stored and built components are deployed.  For the deployed items the =
settings are:
>>
>> DEPLOY_DIR ?=3D "${TMPDIR}/deploy"
>> DEPLOY_DIR_IMAGE ?=3D "${DEPLOY_DIR}/images/${MACHINE}"
>>
>>
>> Each multiconfig requires a separate multiconfig configuration file.
>>
>> See:
>> https://docs.yoctoproject.org/dev-manual/building.html#building-images=
-for-multiple-targets-using-multiple-configurations
>>
>>
>> At a minimum a different TMPDIR is required for each multiconfig.  As =
a best
>> practice, instead of defining each TMPDIR separately, if they are defi=
ned as an
>> append (.=3D operation) with an expected format, later steps can use t=
his
>> information to find the output of the build.  For example:
>>
>> TMPDIR .=3D "-${BB_CURRENT_MC}"
>>
>>
>> This also has the side effect that if the user changes the default TMP=
DIR
>> location in local.conf, all of the multiconfigs will follow with the s=
ame change
>> automatically.
>>
>>
>> For example:
>>
>> conf/multiconfig/baremetal-firmware.conf:
>>
>> TMPDIR .=3D "-${BB_CURRENT_MC}"
>> TCLIBC =3D "newlib"
>>
>>
>> and a custom recipe called 'my-firmware.bb' that uses newlib to build =
baremetal
>> firmware for the device.  my-firmware.bb should define a do_deploy fun=
ction that
>> deploys the baremetal firmware to ${DEPLOYDIR} with a specific name, s=
uch as
>> "my-firmware.elf".
>>
>>
>> Building:
>>
>> Using an 'mcdepend' a recipe in one multiconfig can trigger the build =
in another
>> multiconfig, such as:
>>
>>
>> my-special-firmware.bb:
>>
>> do_compile[mcdepends] =3D "mc::baremetal-firmware:my-firmware:do_deplo=
y"
>>
>>
>> The above will ensure when do_compile is triggered, it further trigger=
s the
>> multiconfig build which will deploy the built firmware.
>>
>>
>>
>> Using the output of the build:
>>
>> However, just because we've built the item using mcdepends, we need to=
 use the
>> output in some way.   We can make a series of assumptions, based on th=
e default
>> Yocto Project variables in order to get the binary for packaging.
>>
>> Adding a do_install task to the example above:
>>
>> my-special-firmware.bb:
>>
>> do_install() {
>>      install -Dm 0644 ${TMPDIR}-baremetal-firmware/deploy/my-firmware.=
elf
>> ${D}/lib/firmware/my-firmware.elf
>> }
>>
>>
>> Doing the above will allow the firmware binary to be transfered and pa=
ckaged
>> into the Linux context and rootfs.  However, this only works if we are=
 careful
>> to not affect TMPDIR outside of specific places, and we use the defaul=
t
>> DEPLOY_DIR (or other) deployment variables.
>>
>>
>> Suggested best practices:
>>
>> TMPDIR (other then the default set in bitbake.conf) is only set in loc=
al.conf by
>> the user.  This means that we should NOT manipulate TMPDIR in any way =
within the
>> machine or distro .conf files.
>>
>> A multiconfig must specify a TMPDIR, and should specify it by appendin=
g the
>> multiconfig name via "-${BB_CURRENT_MC}".
>>
>> All recipes should following the best practices for do_install and do_=
deploy.
>>
>> Recipes that are used to transfer the output from a multiconfig target=
 should
>> use task[mcdepends] to trigger the build of the component, and then tr=
ansfer the
>> item to the current configuration in do_install or do_deploy, assuming=
 the value
>> of the deployed item based on the TMPDIR.
>>
>> Suggested that the dependency and path are specific in a variable to m=
ake it
>> easier to adjust as assumptions change, or the user has specific envir=
onment needs.
>>
>>
>> (we should have some proper examples for this.... i.e.)
>>
>> conf/multiconfig/baremetal-firmware.conf:
>>
>> TMPDIR .=3D "-${BB_CURRENT_MC}"
>> TCLIBC =3D "newlib"
>>
>> recipes-firmware/firmware/my-firmware.bb:
>>
>> do_compile() {
>>      echo "testing" > ${B}/my-firmware.bin
>>
>> do_install() {
>>      install -mD 0644 ${B}/my-firmware.bin ${D}/lib/firmware/my-firmwa=
re.bin
>> }
>>
>> do_deploy() {
>>      install -mD 0644 ${B}/my-firmware.bin ${DEPLOYDIR}/my-firmware.bi=
n
>> }
>>
>> recipes-firmware/firmware/my-special-firmware.bb:
>>
>> INHIBIT_DEFAULT_DEPS =3D "1"
>>
>> FIRMWARE_DEPENDS   ??=3D ""
>> FIRMWARE_MCDEPENDS ??=3D "mc::baremetal-firmware:my-firmware:do_deploy=
"
>> FIRMWARE_FILE      ??=3D "${TMPDIR}-baremetal-firmware/deploy/my-firmw=
are.elf"
>> FIRMWARE_FILE[vardepsexclude] +=3D "TMPDIR"
>>

(forgot the dependency stuff)

do_compile[depends] +=3D "${FIRMWARE_DEPENDS}"
do_compile[mcdepends] +=3D "${FIRMWARE_MCDEPENDS}"
do_compile() {
     :
}

>> do_install() {
>>       if [ ! -e ${FIRMWARE_FILE} ]; then
>>           echo "Unable to find FIRMWARE_FILE (${FIRMWARE_FILE})"
>>           exit 1
>>       fi
>>
>>       install -Dm 0644 ${FIRMWARE_FILE} ${D}/lib/firmware/${FIRMWARE_F=
ILE}
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
>>
>>
>>
>>
>>
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#6063): https://lists.yoctoproject.org/g/docs/messa=
ge/6063
>> Mute This Topic: https://lists.yoctoproject.org/mt/110487932/3616948
>> Group Owner: docs+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [mark.hatle@k=
ernel.crashing.org]
>> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>>


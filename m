Received: from relay6-d.mail.gandi.net (relay6-d.mail.gandi.net [217.70.183.198])
 by mx.groups.io with SMTP id smtpd.web09.34349.1628846116275661326
 for <docs@lists.yoctoproject.org>;
 Fri, 13 Aug 2021 02:15:17 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.198, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay6-d.mail.gandi.net (Postfix) with ESMTPSA id F0C30C0006;
	Fri, 13 Aug 2021 09:15:13 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH 3/3] common-tasks: Add an example of using bbappends to add a file
To: Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Tom Rini <tom.rini@gmail.com>
References: <20210812161027.580-1-trini@konsulko.com>
 <20210812161027.580-3-trini@konsulko.com>
 <20210813082740.ptt5tcfchhapfm67@fedora>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <b03398f7-aa8a-469f-4329-c743d4e7592a@bootlin.com>
Date: Fri, 13 Aug 2021 11:15:13 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20210813082740.ptt5tcfchhapfm67@fedora>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Tom, thanks for the patch.
Quentin, thanks for the review.

On 8/13/21 10:27 AM, Quentin Schulz wrote:
> Hi Tom,
>
> On Thu, Aug 12, 2021 at 12:10:27PM -0400, Tom Rini wrote:
>> Use the xserver-xf86-config_%.bbappend from meta-raspberrypi to provide
>> an example of having a bbappend file add files to an existing recipe.
>>
>> Signed-off-by: Tom Rini <trini@konsulko.com>
>> ---
>>  documentation/dev-manual/common-tasks.rst | 61 +++++++++++++++++++++++
>>  1 file changed, 61 insertions(+)
>>
>> diff --git a/documentation/dev-manual/common-tasks.rst b/documentation/dev-manual/common-tasks.rst
>> index f15e72887c04..87abef9ad52f 100644
>> --- a/documentation/dev-manual/common-tasks.rst
>> +++ b/documentation/dev-manual/common-tasks.rst
>> @@ -554,6 +554,67 @@ The end result of this ``.bbappend`` file is that on a Raspberry Pi, where
>>  used during ``do_fetch`` and the test for a non-zero file size in
>>  ``do_install`` will return true, and the file will be installed.
>>  
>> +Installing Additional Files Using Your Layer
>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>> +
>> +As another example, consider the main xserver-xf86-config recipe and a corresponding
> s/xserver-xf86-config/``xserver-xf86-config``/
>
>> +xserver-xf86-config append file both from the :term:`Source Directory`.
> s/xserver-xf86-config/``xserver-xf86-config``/
>
>> +Here is the main
>> +xserver-xf86-config recipe, which is named ``xserver-xf86-config_0.1.bb`` and located in
> s/xserver-xf86-config/``xserver-xf86-config``/
>
>> +the "meta" layer at ``meta/recipes-graphics/xorg-xserver``::
>> +
>> +   SUMMARY = "X.Org X server configuration file"
>> +   HOMEPAGE = "https://urldefense.proofpoint.com/v2/url?u=http-3A__www.x.org&d=DwIBAg&c=_sEr5x9kUWhuk4_nFwjJtA&r=LYjLexDn7rXIzVmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=XXgYJ9tKXtc_aBqPPa-9XgJe1nXbWkl8dkudu8oFs_Y&s=0zjLRjQF3x_Fv-B-gOPuwnCc_TfOzMJ50SOySYZMbys&e= "
>> +   SECTION = "x11/base"
>> +   LICENSE = "MIT-X"
>> +   LIC_FILES_CHKSUM = "file://${COREBASE}/meta/COPYING.MIT;md5=3da9cfbcb788c80a0384361b4de20420"
>> +   PR = "r33"
>> +
>> +   SRC_URI = "file://xorg.conf"
>> +
>> +   S = "${WORKDIR}"
>> +
>> +   CONFFILES:${PN} = "${sysconfdir}/X11/xorg.conf"
>> +
>> +   PACKAGE_ARCH = "${MACHINE_ARCH}"
>> +   ALLOW_EMPTY:${PN} = "1"
>> +
>> +   do_install () {
>> +	if test -s ${WORKDIR}/xorg.conf; then
>> +		install -d ${D}/${sysconfdir}/X11
>> +		install -m 0644 ${WORKDIR}/xorg.conf ${D}/${sysconfdir}/X11/
>> +	fi
>> +   }
>> +
>> +Following is the append file, which is named ``xserver-xf86-config_%.bbappend``
>> +and is from the Raspberry Pi BSP Layer named ``meta-raspberrypi``. The
>> +file is in the layer at ``recipes-graphics/xorg-xserver``::
>> +
>> +   FILESEXTRAPATHS:prepend := "${THISDIR}/${PN}:"
>> +
>> +   SRC_URI:append:rpi = " \
>> +       file://xorg.conf.d/98-pitft.conf \
>> +       file://xorg.conf.d/99-calibration.conf \
>> +   "
>> +   do_install:append:rpi () {
>> +       PITFT="${@bb.utils.contains("MACHINE_FEATURES", "pitft", "1", "0", d)}"
>> +       if [ "${PITFT}" = "1" ]; then
>> +           install -d ${D}/${sysconfdir}/X11/xorg.conf.d/
>> +           install -m 0644 ${WORKDIR}/xorg.conf.d/98-pitft.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
>> +           install -m 0644 ${WORKDIR}/xorg.conf.d/99-calibration.conf ${D}/${sysconfdir}/X11/xorg.conf.d/
>> +       fi
>> +   }
>> +
>> +   FILES:${PN}:rpi += "${sysconfdir}/X11/xorg.conf ${sysconfdir}/X11/xorg.conf.d/*"
>> +
> Highly suspect this is wrong. It should be FILES:${PN}:append:rpi
> instead, otherwise it's completely overriding FILES:${PN} for rpi (even
> if the operator that is following is +=).
>
> I guess you took this from the bbappend within meta-raspberrypi so it
> would probably  need fixing there.
>
>> +Building off of the previous example, we once again are setting the
>> +:term:`FILESEXTRAPATHS` variable.  In this case we are also usine the
> s/usine the/using/
>
>> +:term:`SRC_URI` to list additional source files to use when ``rpi`` is found in
>> +the list of :term:`OVERRIDES`.  The ``do_install`` task will then perform a
> s/``do_install``/:ref:`ref-tasks-install`/
>
>> +check for an additional :term:`MACHINE_FEATURES` that if set will cause these
> "The do_install task will be extended, for ``rpi`` only, to perform..." instead?
>
>> +additional files to be installed.  These additional files are listed in
>> +:term:`FILES` so that they will be packaged.
>> +
> Same, it's rpi-specific here.


Tom, it's probably better if you prepare a V2 by yourself.
If you can prepare it against "master-next", that will even be easier
for me, as the first two patches were merged there.

Thanks again,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


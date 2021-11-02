Return-Path: <michael.opdenacker@bootlin.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76FAEC433EF
	for <webhook@archiver.kernel.org>; Tue,  2 Nov 2021 18:22:41 +0000 (UTC)
Received: from relay4-d.mail.gandi.net (relay4-d.mail.gandi.net
 [217.70.183.196])
 by mx.groups.io with SMTP id smtpd.web12.1920.1635877359745932496
 for <docs@lists.yoctoproject.org>;
 Tue, 02 Nov 2021 11:22:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=pass (domain: bootlin.com, ip: 217.70.183.196, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay4-d.mail.gandi.net (Postfix) with ESMTPSA id DD127E0009;
	Tue,  2 Nov 2021 18:22:37 +0000 (UTC)
Subject: Re: [docs] [hardknott][PATCH] poky.yaml: fedora33: add missing pkgs
To: Armin Kuster <akuster808@gmail.com>, docs@lists.yoctoproject.org
References: <20210909150842.3299672-1-akuster808@gmail.com>
 <6ad9f754-bfe3-68f8-4498-4147af8c6b02@gmail.com>
From: Michael Opdenacker <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ac89abdf-379e-58dd-b76c-f4db5ab9bdbc@bootlin.com>
Date: Tue, 2 Nov 2021 19:22:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <6ad9f754-bfe3-68f8-4498-4147af8c6b02@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 02 Nov 2021 18:22:41 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/2068

Hi Armin

On 10/28/21 7:10 PM, Armin Kuster wrote:
> ping
>
> On 9/9/21 8:08 AM, Armin Kuster wrote:
>> [ Yocto #14188]
>>
>> The following packages where needed to a fresh FC33 install
>> perl-FindBin
>> perl-File-Compare
>> perl-File-Copy
>> perl-locale
>>
>> Error seen:
>>
>> openssl-native-1.1.1g-r0 do_configure: Execution of '/{snipped}/build/tmp-glibc/work/x86_64-linux/openssl-native/1.1.1g-r0/temp/run.do_configure.14627' failed with exit code 2:
>> Can't locate FindBin.pm in @INC (you may need to install the FindBin module)
>>
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>
>> (cherry picked from commit 5b4127dd72a465ff8c962c425e78140ca8e536db)
>> Signed-off-by: Armin Kuster <akuster808@gmail.com>
>> ---
>>  documentation/poky.yaml | 3 ++-
>>  1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
>> index 02c9bf3dc..7207df142 100644
>> --- a/documentation/poky.yaml
>> +++ b/documentation/poky.yaml
>> @@ -19,7 +19,8 @@ FEDORA_HOST_PACKAGES_ESSENTIAL : "gawk make wget tar bzip2 gzip python3 unzip pe
>>       diffutils diffstat git cpp gcc gcc-c++ glibc-devel texinfo chrpath \
>>       ccache perl-Data-Dumper perl-Text-ParseWords perl-Thread-Queue perl-bignum socat \
>>       python3-pexpect findutils which file cpio python python3-pip xz python3-GitPython \
>> -     python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel"
>> +     python3-jinja2 SDL-devel xterm rpcgen mesa-libGL-devel perl-FindBin perl-File-Compare \
>> +     perl-File-Copy perl-locale"
>>  OPENSUSE_HOST_PACKAGES_ESSENTIAL : "python gcc gcc-c++ git chrpath make wget python-xml \
>>       diffstat makeinfo python-curses patch socat python3 python3-curses tar python3-pip \
>>       python3-pexpect xz which python3-Jinja2 Mesa-libEGL1 libSDL-devel xterm rpcgen Mesa-dri-devel

Richard took care of these ones, but now I have the rights to merge
these by myself.
Cheers
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com



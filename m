Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
 by mx.groups.io with SMTP id smtpd.web08.1254.1617089919690465648
 for <docs@lists.yoctoproject.org>;
 Tue, 30 Mar 2021 00:38:40 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.199, mailfrom: michael.opdenacker@bootlin.com)
X-Originating-IP: 92.150.42.106
Received: from [10.0.0.8] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay9-d.mail.gandi.net (Postfix) with ESMTPSA id C4F14FF80A;
	Tue, 30 Mar 2021 07:38:37 +0000 (UTC)
Subject: Re: [docs] [PATCH v2] UBUNTU sudo apt git instead of git-core
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
To: Janne Kiiskila <janne.kiiskila@pelion.com>, docs@lists.yoctoproject.org
References: <ce7645b2-602f-a675-3c9d-b17f0a742c87@bootlin.com>
 <5247.1617038185636605896@lists.yoctoproject.org>
 <1670E66CACF97B5D.12327@lists.yoctoproject.org>
Organization: Bootlin
Message-ID: <9a948dd4-eed3-b45f-df7b-f69a5f2d2c49@bootlin.com>
Date: Tue, 30 Mar 2021 09:38:36 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <1670E66CACF97B5D.12327@lists.yoctoproject.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hello,

On 3/29/21 9:20 PM, Michael Opdenacker wrote:
> Hi Janne,
>
> On 3/29/21 7:16 PM, Janne Kiiskila wrote:
>>  
>> Signed-off-by: Janne Kiiskila <janne.kiiskila@pelion.com>
>> ---
>>  documentation/poky.yaml | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>  
>> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
>> index 3c30c4430e..2554f1e496 100644
>> --- a/documentation/poky.yaml
>> +++ b/documentation/poky.yaml
>> @@ -11,7 +11,7 @@ YOCTO_POKY : "poky-&DISTRO_NAME_NO_CAP;-&POKYVERSION;"
>>  YOCTO_DL_URL : "https://downloads.yoctoproject.org"
>>  YOCTO_AB_URL : "https://autobuilder.yoctoproject.org"
>>  YOCTO_RELEASE_DL_URL : "&YOCTO_DL_URL;/releases/yocto/yocto-&DISTRO;"
>> -UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git-core diffstat unzip
>> texinfo gcc-multilib \
>> +UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git diffstat unzip
>> texinfo gcc-multilib \
>>       build-essential chrpath socat cpio python3 python3-pip
>> python3-pexpect \
>>       xz-utils debianutils iputils-ping python3-git python3-jinja2
>> libegl1-mesa libsdl1.2-dev \
>>       pylint3 xterm python3-subunit mesa-common-dev"
>
> Thanks for trying, but "git am" still doesn't accept the patch in your
> e-mail after I save it:
>
> $ git am ~/\[docs\]\ \[PATCH\ v2\]\ UBUNTU\ sudo\ apt\ git\ instead\ of\ git-core.eml 
> Applying: UBUNTU sudo apt git instead of git-core
> error: corrupt patch at line 10
> Patch failed at 0001 UBUNTU sudo apt git instead of git-core
> hint: Use 'git am --show-current-patch' to see the failed patch
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
>
> If you could send the e-mail through "git send-email", there would be no
> HTML in your e-mail, and no mangled lines such as:
>
> -UBUNTU_HOST_PACKAGES_ESSENTIAL : "gawk wget git-core diffstat unzip texinf=
> o gcc-multilib \
>
> See the "=" character at the end of line 10... there should be only one
> line.
>
> As explained on
> https://docs.yoctoproject.org/dev-manual/common-tasks.html#using-email-to-submit-a-patch
> , a good way to test what you're sending is save your own e-mail, and
> try to apply it by yourself in a new branch, using the "git am" command.
>
> Again, if that's too much extra work for this simple patch this time, I
> can create the patch for you and give you credits through "Reported-by:".

Eventually, Janne sent me the patch as an attachment, which I could
apply with no problem.

Applied to master-next, thanks !
http://git.yoctoproject.org/cgit/cgit.cgi/yocto-docs/commit/?h=master-next&id=0c84a97aaac30dad5e95561dbfd77f4787b36300

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


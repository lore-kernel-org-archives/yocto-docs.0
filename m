Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.8360.1622208995858417141
 for <docs@lists.yoctoproject.org>;
 Fri, 28 May 2021 06:36:36 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id 23AC720013
	for <docs@lists.yoctoproject.org>; Fri, 28 May 2021 13:36:33 +0000 (UTC)
Subject: Re: [docs] [yocto-docs][PATCH v2] Document erofs filesystem targets
To: docs@lists.yoctoproject.org
References: <20210526215443.16066-1-richard@nod.at>
 <20210527085835.utg3dvjjexg2y2nv@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <9dc795eb-92ef-3505-e6bc-bd50dc2b67d4@bootlin.com>
Date: Fri, 28 May 2021 15:36:33 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527085835.utg3dvjjexg2y2nv@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Richard, Quentin,

On 5/27/21 10:58 AM, Quentin Schulz wrote:
> Hi Richard,
>
> On Wed, May 26, 2021 at 11:54:43PM +0200, Richard Weinberger wrote:
>> Signed-off-by: Richard Weinberger <richard@nod.at>
>> ---
>> Changes since v1:
>>  - Order filesystem types alphabetically (requested by Quentin Schulz)
>> ---
>>  documentation/ref-manual/kickstart.rst | 8 +++++---
>>  documentation/ref-manual/variables.rst | 3 +++
>>  2 files changed, 8 insertions(+), 3 deletions(-)
>>
>> diff --git a/documentation/ref-manual/kickstart.rst b/documentation/ref-manual/kickstart.rst
>> index 8308ffff5b72..a7443f9ea37b 100644
>> --- a/documentation/ref-manual/kickstart.rst
>> +++ b/documentation/ref-manual/kickstart.rst
>> @@ -106,13 +106,15 @@ the ``part`` and ``partition`` commands:
>>  -  ``--fstype``: Sets the file system type for the partition. Valid
>>     values are:
>>  
>> -   -  ``ext4``
>> +   -  ``btrfs``
>>  
>> -   -  ``ext3``
>> +   -  ``erofs``
>>  
>>     -  ``ext2``
>>  
>> -   -  ``btrfs``
>> +   -  ``ext3``
>> +
>> +   -  ``ext4``
>>  
>>     -  ``squashfs``
>>  
>> diff --git a/documentation/ref-manual/variables.rst b/documentation/ref-manual/variables.rst
>> index df6413b68ae9..b0dacf9fbf83 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -3279,6 +3279,9 @@ system and gives an overview of their function and contents.
>>        - cpio.lzma
>>        - cpio.xz
>>        - cramfs
>> +      - erofs
>> +      - erofs-lz4
>> +      - erofs-lz4hc
>>        - ext2
>>        - ext2.bz2
>>        - ext2.gz
> Reviewed-by: Quentin Schulz <foss@0leil.net>


Reviewed-by: Michael Opdenacker <michael.opdenacker@bootlin.com>

Thanks for the patch and the review. I merged it into the "master-next"
branch of "yocto-docs".

Now, Richard will be forced to merge your erofs patches into
openembedded-core ;-)

Good to know that erofs has better read performance than squashfs!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


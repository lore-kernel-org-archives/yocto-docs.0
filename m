Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web12.475.1617731885216628185
 for <docs@lists.yoctoproject.org>;
 Tue, 06 Apr 2021 10:58:05 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: from [192.168.1.20] (amontpellier-552-1-199-211.w109-210.abo.wanadoo.fr [109.210.254.211])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id A1D5A100006;
	Tue,  6 Apr 2021 17:58:02 +0000 (UTC)
Cc: "rpurdie@linuxfoundation.org" <rpurdie@linuxfoundation.org>,
 "nicolas.dechesne@linaro.org" <nicolas.dechesne@linaro.org>
Subject: Re: [docs] [PATCH] releases: update to include 3.2.3
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 "Mittal, Anuj" <anuj.mittal@intel.com>,
 "docs@lists.yoctoproject.org" <docs@lists.yoctoproject.org>,
 "mhalstead@linuxfoundation.org" <mhalstead@linuxfoundation.org>
References: <20210402223011.309701-1-mhalstead@linuxfoundation.org>
 <bcee72baa511ae69997ad5d182e96f0838fc29b8.camel@intel.com>
 <724339bcbea412e7b2b5097d091692d5f9385474.camel@linuxfoundation.org>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <cd707709-4cdc-b80f-7482-00b51fc60f57@bootlin.com>
Date: Tue, 6 Apr 2021 19:58:01 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <724339bcbea412e7b2b5097d091692d5f9385474.camel@linuxfoundation.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Content-Language: en-US

Hi Richard,

On 4/6/21 4:06 PM, Richard Purdie wrote:
> On Mon, 2021-04-05 at 01:16 +0000, Mittal, Anuj wrote:
>> Hi Michael,
>>
>> On Fri, 2021-04-02 at 15:30 -0700, Michael Halstead wrote:
>>> Updating to build 3.2.3 docs and add missing 3.0.4 release line.
>>>
>>> Signed-off-by: Michael Halstead <mhalstead@linuxfoundation.org>
>>> ---
>>>  documentation/poky.yaml                  | 6 +++---
>>>  documentation/releases.rst               | 2 ++
>>>  documentation/sphinx-static/switchers.js | 2 +-
>>>  3 files changed, 6 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/documentation/poky.yaml b/documentation/poky.yaml
>>> index 3c30c4430..de264c963 100644
>>> --- a/documentation/poky.yaml
>>> +++ b/documentation/poky.yaml
>>> @@ -1,12 +1,12 @@
>>> -DISTRO : "3.2.2"
>>> +DISTRO : "3.2.3"
>>>  DISTRO_NAME_NO_CAP : "gatesgarth"
>>>  DISTRO_NAME : "Gatesgarth"
>>>  DISTRO_NAME_NO_CAP_MINUS_ONE : "dunfell"
>>>  DISTRO_NAME_NO_CAP_LTS : "dunfell"
>>> -YOCTO_DOC_VERSION : "3.2.2"
>>> +YOCTO_DOC_VERSION : "3.2.3"
>>>  YOCTO_DOC_VERSION_MINUS_ONE : "3.1.6"
>>>  DISTRO_REL_TAG : "yocto-3.2.2"
>> Should this be yocto-3.2.3?
> I think it should, well spotted. I've queued a patch for that, thanks.


Thanks. I already had a patch prepared, but you were faster than I was.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


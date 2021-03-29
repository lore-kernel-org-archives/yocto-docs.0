Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web08.24176.1617033809941966943
 for <docs@lists.yoctoproject.org>;
 Mon, 29 Mar 2021 09:03:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: from [10.0.0.12] (lfbn-mar-1-834-106.w92-150.abo.wanadoo.fr [92.150.42.106])
	(Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 15CFD24000E;
	Mon, 29 Mar 2021 16:03:27 +0000 (UTC)
Cc: docs@lists.yoctoproject.org
Subject: Re: [docs] [PATCH] Fix typos and spacing
To: Quentin Schulz <quentin.schulz@streamunlimited.com>
References: <20210329132302.52046-1-michael.opdenacker@bootlin.com>
 <20210329151903.vvooyzogdn3n7gxb@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <ba20eef9-e082-e446-3013-4a15c13347e3@bootlin.com>
Date: Mon, 29 Mar 2021 18:03:27 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.7.1
MIME-Version: 1.0
In-Reply-To: <20210329151903.vvooyzogdn3n7gxb@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Quentin,

Many thanks for your review!

On 3/29/21 5:19 PM, Quentin Schulz wrote:
>> @@ -2111,8 +2111,7 @@ accomplished using fakeroot.
>>     under fakeroot. Otherwise, the task cannot run root-only operations,
>>     and cannot see the fake file ownership and permissions set by the
>>     other task. You need to also add a dependency on
>> -   virtual/fakeroot-native:do_populate_sysroot
>> -   , giving the following:
>> +   virtual/fakeroot-native:do_populate_sysroot, giving the following:
>>     ::
> This is usually the tell of a bad outcome of the migration tool. I'm
> pretty sure what was meant here is:
> other task. You need to also add a dependency on
> ``virtual/fakeroot-native:do_populate_sysroot``, giving the following:

Oops, this definitely makes sense.

>>  
>>     It is not a requirement that a layer name begin with the prefix
>> -   meta-
>> -   , but it is a commonly accepted standard in the Yocto Project
>> +   meta-, but it is a commonly accepted standard in the Yocto Project
> Same here, ``meta-``.
>
> Basically, you just encountered the files we haven't manually reviewed
> yet :)
>
> Outside of obvious typos, anything with a weird indentation/syntax
> usually requires manual inspection. I used to compare with 3.0 docs to
> check what was intended and then fix it to match whatever was the state
> before.
>
> I would say it's better to leave those indentation/syntax issues as is
> and take the time to fix them properly because they are pretty easy to
> spot once your brain has picked up the patterns :)


Agreed. I'll drop these in the current patch and will address them
separately. Indeed, I've seen a few other looking like these ones.

Thanks again!

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


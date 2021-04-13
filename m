Received: from cpanel8.indieserve.net (cpanel8.indieserve.net [199.212.143.3])
 by mx.groups.io with SMTP id smtpd.web11.2491.1618343366845546444
 for <docs@lists.yoctoproject.org>;
 Tue, 13 Apr 2021 12:49:27 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: crashcourse.ca, ip: 199.212.143.3, mailfrom: rpjday@crashcourse.ca)
Received: from [::1] (port=35750 helo=cpanel8.indieserve.net)
	by cpanel8.indieserve.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256
	(Exim 4.94)
	(envelope-from <rpjday@crashcourse.ca>)
	id 1lWP2L-008mbY-6f
	for docs@lists.yoctoproject.org; Tue, 13 Apr 2021 15:49:25 -0400
Received: from [136.2.16.185] ([136.2.16.185]) by crashcourse.ca (Horde
 Framework) with HTTPS; Tue, 13 Apr 2021 15:49:24 -0400
Date: Tue, 13 Apr 2021 15:49:24 -0400
Message-ID: <20210413154924.Horde.9mF6pF5pjl-91ilmhFusaj6@crashcourse.ca>
From: "Robert P. J. Day" <rpjday@crashcourse.ca>
To: docs@lists.yoctoproject.org
Subject: Re: [docs] ref-manual: reverse the order of migration guides?
References: <7ff7831f-4539-8e5c-cfc6-d081651374f2@bootlin.com>
 <086834e9b9a79fb30a11d160bb7a02037cd05c29.camel@linuxfoundation.org>
In-Reply-To: <086834e9b9a79fb30a11d160bb7a02037cd05c29.camel@linuxfoundation.org>
User-Agent: Horde Application Framework 5
MIME-Version: 1.0
X-OutGoing-Spam-Status: No, score=-1.0
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - cpanel8.indieserve.net
X-AntiAbuse: Original Domain - lists.yoctoproject.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - crashcourse.ca
X-Get-Message-Sender-Via: cpanel8.indieserve.net: authenticated_id: rpjday@crashcourse.ca
X-Authenticated-Sender: cpanel8.indieserve.net: rpjday@crashcourse.ca
X-Source: 
X-Source-Args: 
X-Source-Dir: 
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
Content-Disposition: inline


Quoting Richard Purdie <richard.purdie@linuxfoundation.org>:

> On Tue, 2021-04-13 at 20:03 +0200, Michael Opdenacker wrote:
>> Greetings,
>>
>> Wouldn't it make sense to reverse the order of migration guides in the
>> reference manual
>> (https://www.yoctoproject.org/docs/3.0/ref-manual/ref-manual.html#migration)?
>>
>> I guess it would be easier to start mentioning the migration path from
>> the most recent release, as version 1.3 looks ancient.
>>
>> Would it make sense? If so, it's easy to propose a patch...
>
> Yes, I think it would. When we made the migration to sphinx, I took  
> the decision
> to split these into their own files. This is a next logical step from that.

   i'd go for moving all the migration stuff into its own manual ...
the reference manual is chock full as it is, there's no point making
it even larger with material that new users won't care about.

rday




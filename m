Received: from relay10.mail.gandi.net (relay10.mail.gandi.net [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web09.9139.1622212409254168410
 for <docs@lists.yoctoproject.org>;
 Fri, 28 May 2021 07:33:30 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.230, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 21B7424000D;
	Fri, 28 May 2021 14:33:26 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [PATCH] ref-manual: add DEBUGFS-related variables to glossary
To: Quentin Schulz <quentin.schulz@streamunlimited.com>,
 "Robert P. J. Day" <rpjday@crashcourse.ca>
References: <b3b0312-688f-1b68-ac2b-29db8163cc9a@crashcourse.ca>
 <20210527103344.pqxrbddld5rtpbge@qschulz>
 <456a26f-3bb5-5b29-88a6-3db82a99ed82@crashcourse.ca>
 <20210527160949.mgdmbern2wynmdq2@qschulz>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <81053fbb-8c3a-7a0f-d17a-2e678efa9fe8@bootlin.com>
Date: Fri, 28 May 2021 16:33:26 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <20210527160949.mgdmbern2wynmdq2@qschulz>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Robert,

On 5/27/21 6:09 PM, Quentin Schulz wrote:
> On Thu, May 27, 2021 at 11:58:07AM -0400, Robert P. J. Day wrote:
>>   for the sake of brevity in the glossary, it would be better to keep
>> glossary entries short, and link to longer explanations or tutorials.
>> i can add such a link if such a section exists. is there somewhere a
>> decent explanation?
>>
> Makes sense.
>
> A quick grep returned
> https://docs.yoctoproject.org/dev-manual/common-tasks.html#using-the-gdbserver-method
> point 1.


Thanks again for your contribution. If you update your text with this
reference, as you suggested, I'll be happy to merge your patch.

The controversity with the "DEBUGFS" name is another story, and
definitely not your choice.

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


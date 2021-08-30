Received: from relay11.mail.gandi.net (relay11.mail.gandi.net [217.70.178.231])
 by mx.groups.io with SMTP id smtpd.web11.16340.1630327888231552754
 for <docs@lists.yoctoproject.org>;
 Mon, 30 Aug 2021 05:51:28 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.178.231, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay11.mail.gandi.net (Postfix) with ESMTPSA id E03A210000A;
	Mon, 30 Aug 2021 12:51:25 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] what's the standard for em dashes in sphinx for YP docs?
To: "Robert P. J. Day" <rpjday@crashcourse.ca>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>
References: <c81c363-94a9-da8c-4d9f-32ec8415d245@crashcourse.ca>
 <20210830080327.zasqwk4jz5me24p5@fedora>
 <b177648e-ff38-f0d9-9548-ea46471513f3@crashcourse.ca>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <356727d3-c50e-d0df-d758-44c3d257817b@bootlin.com>
Date: Mon, 30 Aug 2021 14:51:25 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <b177648e-ff38-f0d9-9548-ea46471513f3@crashcourse.ca>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hello,

On 8/30/21 10:12 AM, Robert P. J. Day wrote:
> On Mon, 30 Aug 2021, Quentin Schulz wrote:
>
>> Hi Robert,
>>
>> On Sat, Aug 28, 2021 at 12:08:34PM -0400, Robert P. J. Day wrote:
>>>   i want to play with sentence structure, and in some places, the "em"
>>> dash is clearly appropriate. apparently, a triple "---" renders nicely
>>> into a long dash. is that the standard?
>>>
>> The only issue I could see with using "em" dashes is that it makes it
>> harder to grep for them.
>>
>> Also, we'll probably forget to enforce this in future patches :)
>>
>> I don't have much more to add to the discussion though.
>   yeah, the instant i used a grep, i realized the worm can i was
> opening up.


Indeed (because of the use of "-" and "=" in styling paragraphs)!
However, that's still possible to catch unique instances of "---":
git grep -E "[^-](\-){3}[^-]"

After reading https://www.scribbr.com/language-rules/dashes/, it seems
to me that proper dashes ("--" for "en dashes" and "---" for "em
dashes") should still be used in proper documentation.

What would be the drawback of using those? Even if "---" and "--" alone
are a bit hard to grep, what else would they make harder to process?

Cheers,
Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


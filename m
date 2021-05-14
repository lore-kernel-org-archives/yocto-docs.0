Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
 by mx.groups.io with SMTP id smtpd.web08.11433.1621010757776677411
 for <docs@lists.yoctoproject.org>;
 Fri, 14 May 2021 09:45:58 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: bootlin.com, ip: 217.70.183.200, mailfrom: michael.opdenacker@bootlin.com)
Received: (Authenticated sender: michael.opdenacker@bootlin.com)
	by relay7-d.mail.gandi.net (Postfix) with ESMTPSA id CE64D20005;
	Fri, 14 May 2021 16:45:55 +0000 (UTC)
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: Re: [docs] [yocto-docs][dunfell] ref-system-requirements.rst: Add Fedora 33 to list of supported distros
To: Steve Sakoman <steve@sakoman.com>
References: <cover.1620838359.git.steve@sakoman.com>
 <07669400a5affa6bc19a5bfdea9ebc05db0b07e3.1620838359.git.steve@sakoman.com>
 <995ed3d0-0f9d-5780-bd69-e7b4a2975239@bootlin.com>
 <CAOSpxdYgWptnMrUR=GTS5tqJ7aJY59gkygq5r0KSeRv7oYi+Jw@mail.gmail.com>
From: "Michael Opdenacker" <michael.opdenacker@bootlin.com>
Organization: Bootlin
Message-ID: <5ba6eed2-1b1a-4fbf-536d-4e91304dfb20@bootlin.com>
Date: Fri, 14 May 2021 18:45:55 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.8.1
MIME-Version: 1.0
In-Reply-To: <CAOSpxdYgWptnMrUR=GTS5tqJ7aJY59gkygq5r0KSeRv7oYi+Jw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Hi Steve,

On 5/14/21 6:09 PM, Steve Sakoman wrote:
> On Thu, May 13, 2021 at 11:19 PM Michael Opdenacker
> <michael.opdenacker@bootlin.com> wrote:
>> Hi Steve,
>>
>> On 5/12/21 6:54 PM, Steve Sakoman wrote:
>>> Signed-off-by: Steve Sakoman <steve@sakoman.com>
>>> ---
>>>  documentation/ref-manual/ref-system-requirements.rst | 2 ++
>>>  1 file changed, 2 insertions(+)
>>>
>>> diff --git a/documentation/ref-manual/ref-system-requirements.rst b/documentation/ref-manual/ref-system-requirements.rst
>>> index 65234d072..bb688772f 100644
>>> --- a/documentation/ref-manual/ref-system-requirements.rst
>>> +++ b/documentation/ref-manual/ref-system-requirements.rst
>>> @@ -55,6 +55,8 @@ distributions:
>>>
>>>  -  Fedora 32
>>>
>>> +-  Fedora 33
>>> +
>>
>> If Fedora 33 is supported in our LTS, shouldn't we support it too in the
>> next release? I could propose the same update to the "master" branch of
>> yocto-docs...
> I suspect master has more changes than just this one!  Taking a quick look at:
>
> https://git.yoctoproject.org/cgit/cgit.cgi/meta-yocto/tree/meta-poky/conf/distro/poky.conf
>
> shows that there are some additions as well as at least one deletion.


Oops, indeed! Thanks for the reference.

>
> So, yes, master should be updated to reflect the current requirements
> in poky.conf
>
> It may well be that gatesgarth/hardknott aren't quite correct either.


Sure, I'll propose updates to both.

Thanks again,

Cheers,

Michael.

-- 
Michael Opdenacker, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com


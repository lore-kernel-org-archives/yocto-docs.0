Received: from relay3-d.mail.gandi.net (relay3-d.mail.gandi.net [217.70.183.195])
 by mx.groups.io with SMTP id smtpd.web12.16296.1604074878450758243
 for <docs@lists.yoctoproject.org>;
 Fri, 30 Oct 2020 09:21:18 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.183.195, mailfrom: foss@0leil.net)
X-Originating-IP: 80.110.109.234
Received: from [192.168.13.190] (80-110-109-234.cgn.dynamic.surfer.at [80.110.109.234])
	(Authenticated sender: foss@0leil.net)
	by relay3-d.mail.gandi.net (Postfix) with ESMTPSA id 15D9D60005;
	Fri, 30 Oct 2020 16:21:14 +0000 (UTC)
Date: Fri, 30 Oct 2020 17:21:09 +0100
In-Reply-To: <CAP71Wjy0uvFbN4+yQHOteCVef0Jb9d98U_1jM05D2pc9Bx-iDQ@mail.gmail.com>
References: <d39d9b0-512a-d035-cd5-f6313bf41d@crashcourse.ca> <CAP71Wjy0uvFbN4+yQHOteCVef0Jb9d98U_1jM05D2pc9Bx-iDQ@mail.gmail.com>
MIME-Version: 1.0
Subject: Re: [docs] possible marker cleanup: ": ::$" -> "::"
To: docs@lists.yoctoproject.org,Nicolas Dechesne <nicolas.dechesne@linaro.org>,"Robert P. J. Day" <rpjday@crashcourse.ca>
CC: YP docs mailing list <docs@lists.yoctoproject.org>
From: "Quentin Schulz" <foss@0leil.net>
Message-ID: <02192FE0-FFAB-43AC-A4F1-4B779EA28991@0leil.net>
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi all,

On October 30, 2020 5:03:06 PM GMT+01:00, Nicolas Dechesne <nicolas=2Edech=
esne@linaro=2Eorg> wrote:
>On Fri, Oct 30, 2020 at 4:07 PM Robert P=2E J=2E Day
><rpjday@crashcourse=2Eca> wrote:
>>
>>
>>   in the midst of messing with "::" markers, i just noticed that
>there
>> is a *ton* of literal code block markers of the form:
>>
>>   =2E=2E=2E blah blah: ::
>>
>>      code stuff
>>
>> this seems clearly overkill as the trailing "::" obviously starts a
>> literal block, while the definition of the marker includes the
>> explanation:
>>
>>   If it is preceded by whitespace, the marker is removed=2E
>>
>> in short, this appears to be *exactly* equivalent as if you had
>simply
>> written:
>>
>>   =2E=2E=2E blah blah::
>>
>>      code stuff
>>
>> the apparent effect in the original being to start a literal block
>> while leaving the preceding colon there -- just what ending with "::"
>> provides=2E does that seem about right? one suspects there is a pile of
>> marker simplification could be done=2E
>
>You are correct=2E all instances of ": ::" can be replaced with "::"=2E I=
f
>you make the change, you will notice that the generated HTML is not
>changing=2E
>So it's a style question=2E I would prefer the short "::" form, let's
>check with RP and Quentin first as they have been the main
>contributors so far!
>

To be honest, I don't know much about reST=2E I learned the very basics of=
 it while doing the clean ups=2E

Anyway, I don't really like it because it's not that explicit (though it i=
s documented) that :: without a space actually is identical to : ::=2E At t=
he same time, it's a "programming language" thing/quirk/implementation so I=
'm sure we can teach/document/enforce it as much as we would for Python or =
any other language one uses=2E

The nice outcome out of this is consistency and I'm a sucker for that kind=
 of improvement, so all good for me=2E



By the way, if we are starting to fix that kind of thing, I'd like to requ=
est some kind of guidelines, formatting rules, etc=2E=2E so that we have co=
nsistency and make it easier both to contribute and to review? And put thos=
e into a README or something?

E=2Eg=2E I still have no clue on the max characters in a line=2E We also d=
iscussed adding :term:`` for each variable in the glossary (probably same f=
or tasks/classes?)=2E Still on my to-do list to not use <#blablbla> for int=
ernal links as sphinx does not detect broken links at build time when this =
is used=2E Basically anything that isn't specific to Sphinx but YP's docume=
ntation=2E

Anyway, that's off topic=2E

Thanks Robert for sharing your knowledge and improving the docs :)

Quentin
--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E

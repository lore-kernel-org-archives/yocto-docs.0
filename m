Return-Path: <foss@0leil.net>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22E60C433F5
	for <webhook@archiver.kernel.org>; Wed,  6 Oct 2021 07:41:22 +0000 (UTC)
Received: from relay10.mail.gandi.net (relay10.mail.gandi.net
 [217.70.178.230])
 by mx.groups.io with SMTP id smtpd.web11.8777.1633506078719133067
 for <docs@lists.yoctoproject.org>;
 Wed, 06 Oct 2021 00:41:19 -0700
Authentication-Results: mx.groups.io;
 dkim=missing;
 spf=none, err=permanent DNS error (domain: 0leil.net, ip: 217.70.178.230,
 mailfrom: foss@0leil.net)
Received: (Authenticated sender: foss@0leil.net)
	by relay10.mail.gandi.net (Postfix) with ESMTPSA id 8DAE324000D;
	Wed,  6 Oct 2021 07:41:15 +0000 (UTC)
Date: Wed, 06 Oct 2021 09:41:14 +0200
From: Quentin Schulz <foss@0leil.net>
To: docs@lists.yoctoproject.org,
 Michael Opdenacker <michael.opdenacker@bootlin.com>,
 Quentin Schulz <quentin.schulz@theobroma-systems.com>,
 Nicolas Dechesne <nicolas.dechesne@linaro.org>
CC: YP docs mailing list <docs@lists.yoctoproject.org>
Subject: =?US-ASCII?Q?Re=3A_=5Bdocs=5D_=5BPATCH_2/4=5D_?=
 =?US-ASCII?Q?docs=3A_sphinx-static=3A_swi?=
 =?US-ASCII?Q?tchers=2Ejs=3A_correctly_highlight_obsolete_releases?=
In-Reply-To: <0c6caeec-da66-2bc1-1f6f-6e93c7dd009f@bootlin.com>
References: <20210928162202.749990-1-quentin.schulz@theobroma-systems.com>
 <20210928162202.749990-2-quentin.schulz@theobroma-systems.com>
 <CAP71WjzPeZJQsesFc=uweY9=C_QyDOR3UmX5YE4qnWLEVkdWLA@mail.gmail.com>
 <20211005141141.xmaltlqoju27rd4h@fedora>
 <0c6caeec-da66-2bc1-1f6f-6e93c7dd009f@bootlin.com>
Message-ID: <815A38D5-A8DA-427A-9349-1CFECF22CE14@0leil.net>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 06 Oct 2021 07:41:22 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/1919



On October 5, 2021 6:29:11 PM GMT+02:00, Michael Opdenacker <michael=2Eopd=
enacker@bootlin=2Ecom> wrote:
>Quentin, Nicolas,
>
>Thanks for the proposals!
>
>On 10/5/21 4:11 PM, Quentin Schulz wrote:
>> This is a different topic but yes we should settle on some solution tha=
t
>> is better than this=2E We could have a separate git repo somewhere for
>> that file=2E Then I can think of two solutions:
>>
>> 1) git clone this repo as part of the documentation
>>  publishing/development, which is "nicer" because it's explicit the
>>  switchers=2Ejs is the same for all releases but it's still just a clea=
ner
>>  way to implement the find command above,
>>
>> 2) have the web server serve this js in a
>>  docs=2Eyoctoproject=2Eorg/somepath/switchers=2Ejs and add this path to=
 the
>>  sphinx template, though we would need to think of a way to not need
>>  internet access on local development but I'm sure we can think of some
>>  hackish way :)
>
>
>I'd vote for 1), which looks cleaner=2E The file served by the webserver
>would be in a git repository anyway=2E
>

Absolutely, the difference being `git clone` during development or a <scri=
pt> in the <head> of the docs=2Eyoctoprpject=2Eorg pointing to a URL=2E

>>
>> Also, I would very much like we have a similar mechanism for the
>> theme_override=2Ecss for Sphinx because I've fixed a few things in the
>> last few months and those aren't shown on old releases=2E
>>
>>> I've faced issues when trying to load an 'external' XML file into the
>>> docs website (something to deal with proxy or permissions=2E=2E)=2E=2E=
 so I
>>> tried to have the 'release information' in one structure (in
>>> switchers=2Ejs as an intermediate step), which looks like that:
>>>
>>> +  var all_versions =3D [
>>> +    {'version' : 'dev', 'name' : 'dev (3=2E3)', 'show' : 'yes'},
>>> +
>>> +    {'version' : '3=2E2',   'show' : 'yes'},
>>> +
>>> +    {'version' : '3=2E1=2E3', 'show' : 'yes', 'docbook' : 'yes'},
>>> +    {'version' : '3=2E1=2E2', 'show' : 'yes', 'docbook' : 'yes', 'sta=
te'
>>> : 'outdated'},
>>> +    {'version' : '3=2E1=2E1', 'show' : 'yes', 'docbook' : 'yes', 'sta=
te'
>>> : 'outdated'},
>>> +    {'version' : '3=2E1',   'show' : 'yes', 'docbook' : 'yes', 'state=
'
>>> : 'outdated'},
>>> +
>>> +    {'version' : '3=2E0=2E4', 'show' : 'yes', 'docbook' : 'yes', 'sta=
te'
>>> : 'obsolete'},
>>> +    {'version' : '3=2E0=2E3', 'show' : 'no', 'docbook' : 'yes', 'stat=
e' :
>>> 'obsolete'},
>>> +    {'version' : '3=2E0=2E2', 'show' : 'no', 'docbook' : 'yes', 'stat=
e' :
>>> 'obsolete'},
>>> +    {'version' : '3=2E0=2E1', 'show' : 'no', 'docbook' : 'yes', 'stat=
e' :
>>> 'obsolete'},
>>> +    {'version' : '3=2E0',   'show' : 'no', 'docbook' : 'yes', 'state'=
 :
>>> 'obsolete'},
>>> +
>>> +    {'version' : '2=2E7=2E4', 'show' : 'yes', 'docbook' : 'yes', 'sta=
te'
>>> : 'obsolete'},
>>> +    {'version' : '2=2E7=2E3', 'show' : 'no', 'docbook' : 'yes', 'stat=
e' :
>>> 'obsolete'},
>>> +    {'version' : '2=2E7=2E2', 'show' : 'no', 'docbook' : 'yes', 'stat=
e' :
>>> 'obsolete'},
>>> +    {'version' : '2=2E7=2E1', 'show' : 'no', 'docbook' : 'yes', 'stat=
e' :
>>> 'obsolete'},
>>> +    {'version' : '2=2E7',   'show' : 'no', 'docbook' : 'yes', 'state'=
 :
>>> 'obsolete'},
>>> +  ];
>>>
>>> At least, it becomes straightforward to insert a new release in the
>>> table=2E=2E I am not sure I ever showed that=2E=2E so adding more to t=
he
>>> discussion=2E=2E I am sure the project would benefit from an overall
>>> releases information database in a few other places, so that could be
>>> extended=2E
>>>
>>>  [1] https://urldefense=2Eproofpoint=2Ecom/v2/url?u=3Dhttp-3A__git=2Ey=
octoproject=2Eorg_cgit_cgit=2Ecgi_yocto-2Dautobuilder-2Dhelper_tree_scripts=
_run-2Ddocs-2Dbuild&d=3DDwIBaQ&c=3D_sEr5x9kUWhuk4_nFwjJtA&r=3DLYjLexDn7rXIz=
VmkNPvw5ymA1XTSqHGq8yBP6m6qZZ4njZguQhZhkI_-172IIy1t&m=3DIkqJJb6C5WoayEw2QGU=
j-ZxPis-lTJKhRZGrreYumxY&s=3DxoOeS1RNOATX4K5WSvEy7WE1VZbB9hXH_f_BWQ_Ea1g&e=
=3D=20
>>>
>> I don't know how far we are from implementing *a* new (hopefully) bette=
r
>> solution for this, so shall I just go on with the dictionary suggested
>> above?
>>
>> You probably did and I probably forgot since then :)
>>
>> Lastly, you talked about on IRC or in another mail I don't remember tha=
t
>> you would very much see this array in a separate file so that it can be
>> reused in other parts (and why not in some automation
>> tests/scripts/builds/whatever) so that we only have to maintain one fil=
e
>> and everything depending on releases and in which state they are, etc=
=2E=2E
>> would be gathered at the same place=2E I guess we could put this info i=
nto
>> a json file that is then loaded and parsed by the javascript though we
>> have to make sure the parsing of the JSON is safe, which is another
>> topic in itself :)
>
>
>By the way, it would also be nice to include the release date and EOL
>date (which could be in the past=2E=2E=2E that's another way of marking a
>release as obsolete)=2E This way, we could have the information of whethe=
r
>a release is obsolete or otherwise until when it will supported, in the
>documentation itself and on the release pages too, and not just on a
>wiki page=2E
>
>This would address https://bugzilla=2Eyoctoproject=2Eorg/show_bug=2Ecgi?i=
d=3D14503
>

That's something we could add later also if needed, just need to add prope=
r keys to the JSON dictionary and not change the current layout so we don't=
 break anything =E2=98=BA=EF=B8=8F

>Quentin, am I right to assume that we're waiting for further decisions
>on this thread before merging your commits? Or do you think we could
>already merge some of them?
>

Waiting on feedback and decision on what to do next=2E No merge yet=2E

Cheers,
Quentin

>Thanks again,
>
>Michael=2E
>


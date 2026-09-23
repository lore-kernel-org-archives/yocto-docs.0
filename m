Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9BABEC982EA
	for <webhook@archiver.kernel.org>; Wed, 23 Sep 2026 10:43:48 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.55])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.4321.1790160225725390659
 for <docs@lists.yoctoproject.org>;
 Wed, 23 Sep 2026 03:43:46 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=IODeXCpe;
 spf=pass (domain: cherry.de, ip: 40.107.162.55, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h0D1N1GIxe20eP3CCAfmDHQAa/a/44dLVf7NdQwId+LJxW9gQJZCbi8h3ZtOd1m9ultCk2x85x5S8wLbekJ3GBFPyPpSizmJushfrEcizViTVeV2P16WPNNIitdFjuJ2GHgoPnhw8gCY8KC/dqRkjQyRWDp0/oeSk6vzE98pugj1P1MB/xZMy7gouLuTaAwXpNnAz++Mmdt5C7YwlQtifV7HYA2jp5WBDcUFU2/USVNgjxz2e/1DBWXc3trmo0NTXP4IPZs6l3UN0Q/gjNbzDdUqcpiyJUyIDQKhwpdw5AdZdYZvEVX/C/zz/guaWZZ7wLJemUJ5aWi2tqnNCZM9bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YC1f41VmRP5yffsUOalTZJP+/FJMAk9qaz3NvEzMQJ8=;
 b=nM/F4khGKobZ4n8s3q/HmF0eJXOuuZTqSpNUUDcmq3brJfNvzy42hgwcLr1MIuqAg6Cjlt9FlIEypuzbHx2+Lge675P/iqHEVveG+dpR9EKNTiYsuKm4i1SBSZAAOBbTG4NBhYDW7fgZuRf4dDVOXLavt0hHmnSZj956C2m37wgqItRvb/CN5w5gh6JjCNdu8YuUEKYP8bQtZUU7PwAMBLIdYeYG2eYDvRLUl9K7zFGd9JcS/2ARio4xohtKpSSkMEVenuUG3pJmDEXYVaC+wCqHX+kwZhKiwo/sjXNRiJFYKqChJbkefLqSic6u+Y68Uu7tAEunqMdroNeSBWFRbQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YC1f41VmRP5yffsUOalTZJP+/FJMAk9qaz3NvEzMQJ8=;
 b=IODeXCpe1jPQUuGe08y7lvL2HQNzksxv1Fncoob+brLWzXP16/HshDvwZex5SAWB8UNtsaEdIyj9Tb4ZJ62d3sjo42PDvlXuxj3BggG96A9zh8rg9pckzjpOufrtpkPtdNDOChDkBExNGIheHflExtC7CR/mfp9RH9wdmMMRii4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com (2603:10a6:102:4ab::7)
 by DU2PR04MB8533.eurprd04.prod.outlook.com (2603:10a6:10:2d4::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.451.14; Wed, 23 Sep
 2026 10:43:41 +0000
Received: from PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d]) by PA3PR04MB11153.eurprd04.prod.outlook.com
 ([fe80::6b02:c0eb:95a4:3c3d%5]) with mapi id 15.21.0451.014; Wed, 23 Sep 2026
 10:43:41 +0000
Message-ID: <f46731b3-d08a-4ba2-bc76-de91e08750e5@cherry.de>
Date: Wed, 23 Sep 2026 12:43:41 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH v2 2/8] docs: copy only the command from a console
 block
To: twoerner@gmail.com, docs@lists.yoctoproject.org
References: <20260922183249.2433345-1-twoerner@gmail.com>
 <20260922183249.2433345-3-twoerner@gmail.com>
 <ec0f6709-aebc-473a-aa29-121819b6f97d@cherry.de>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <ec0f6709-aebc-473a-aa29-121819b6f97d@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VIUP296CA0113.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:350::6) To PA3PR04MB11153.eurprd04.prod.outlook.com
 (2603:10a6:102:4ab::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PA3PR04MB11153:EE_|DU2PR04MB8533:EE_
X-MS-Office365-Filtering-Correlation-Id: a15f77ce-e130-4630-2cfd-08df195f88bd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|23010399003|4022899009|366016|1800799024|4143699003|56012099006|11063799006|5023799004|10067099003|22082099003|18002099003|6133799003|4133799003|13003099007|3023799007;
X-Microsoft-Antispam-Message-Info: 
	xwWhHq3kJYa7hiA/PysIJtnDExvBAtPmQi60Zum/kzoMBbbi0hnIjx+A6qt8PwU9/yg9DM/Zo8L6DBF6ySwi0GeZKn2G+17iFze6A7uWfkfWakcY/mS7Ovpn0Ic35d6IainOWIfePPrj3HJ1z6IurzOX+K4uQSHmVz0LcWS6G+9EahaWHYQkYED1q/9ilR/zNHj2J7t649NZKIMhTIkgll8MxUJFaU05EtBSh5zpEFMKovX7xnXf9j82LGIwesBGgtdkInmk1UdxYOrPweMh2SjLzCStYCsVEtI9gCcn6eqo1lOGyvRvRF8BxA1t1Sr3pf59sq5gSxdUnQ+aJ5yNZMIiwscuskqvVdpspBUf5ubNKwO0d3l7EgrcA19wuL9lh1jqu10RDpU1M99fQgh3tETbo+/OWKAkxcHPyZen0X6nJKcEWGz2jC+bf152IoXqAKQ16LK/tHyAkVr0shywyiNww6uZcB+Jkp8527ztvfM9tq6A1fRowjkhQ6psXGydHpVgDYjHvcFiSIfLhaWsZMqTqwAd2Y6Gik4uT+V6Ti9u1WaiMIRffnuY93oezLU8/mmEGkAYnvr8wHi2nuFBwNvB9lP7529zQp18pXdc8j8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PA3PR04MB11153.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(23010399003)(4022899009)(366016)(1800799024)(4143699003)(56012099006)(11063799006)(5023799004)(10067099003)(22082099003)(18002099003)(6133799003)(4133799003)(13003099007)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?6MQk3k4SVxj//W7p3RZ7xATpZxYVqoSXclzKch9U+cOi9CSe/EpiGDhIH0gQ?=
 =?us-ascii?Q?E7cKFjQhQJeyRfeMU3ovJOdUfwEc2oXBL3NAiTgF9nP9Ud05UQmYvf+bKGdX?=
 =?us-ascii?Q?89WEnna+f2mHpCYd17CJHoOcZG0UpXMFRocNuqbJeHvyl8JUpl10CpY34e8e?=
 =?us-ascii?Q?Bgn5GAWJVX21Kqy80ykfiluH5CIa9mIZmzErqyl88VEW17641VqZIRsa2bCg?=
 =?us-ascii?Q?G7cEposd3OMhCXh3mAYqP6zTH+UvGfhfjT4jaTyWrNqM4p/CxY1dXUQiJkA0?=
 =?us-ascii?Q?N2Jt1Q7OmhCaByO9CxS73nYbokhf1jcJ4uPAhpwWBwbyeexL2WymGfw8ihcm?=
 =?us-ascii?Q?gHwgbQ1DL7Ghe9AslvHFILnPlA/KO/KtYDv5WEQ9kHzvTaPlt3vFpp7zIrYL?=
 =?us-ascii?Q?v2shYISUgyJ/sw7JASRpTvxl5M+bJCw2y+6EEN+b5o5/lPHUsZNYy7zmvVr9?=
 =?us-ascii?Q?K4fnGWfdNHu3qszDXEosLIe0DlTXy584TPdhwVLzMO2XPdbBJbjpqgd2tU4F?=
 =?us-ascii?Q?Cb8t7I7NmTP0L4fsRNZbxK/VCLBlriE8NdpnMAo6t95acdn8deeCbCBTorC3?=
 =?us-ascii?Q?/dYeae7Q5dswG+5d+gzVauvsqVDBXZR/QxtVMV9/T3stI9iPBnbZbPtFGOjX?=
 =?us-ascii?Q?CzIoSxBK6xN5p3F6dlXMJ7fDdGzHpjDTbiMe5/xj3CerFD4j1tpPe1fDz/ls?=
 =?us-ascii?Q?afRQ/vg8G8cLXmmfIiRwX2ZvbkZcA9dL2DGq8ojwE9z/m/WTR+1kQ+6Z9hiG?=
 =?us-ascii?Q?hDp9dTpj8SYR+0GGIBKqqMtE7r0gfIZ83wMyCbATuwpRXa6PXMPXX1hsrgMj?=
 =?us-ascii?Q?RwaUhuChASdWal+LmNnILAzajoK13jxWqKNOYqyZqguwDlsUkIIsBVlL9SkH?=
 =?us-ascii?Q?MwxqNtqXqLp4sXG8tEknheU8jrHTTqMUFByv1RnYzZgJGyd4onz9zQi/FQ4M?=
 =?us-ascii?Q?VT8tQFfa5HYnwD2YeCUFo3o0Y/Z+CBx+fLxQK0EMHyWyOtRLYsxvsDcitdY8?=
 =?us-ascii?Q?valjaCPMH2X25r5KSLgP3phfq+OKtR7SAvoMqTVNvP8Kv2QDC3x2+2TsYdlT?=
 =?us-ascii?Q?cUeusDsz+bp1fzWh7s70HcPLEcn4BrJsf+Nw+4eBv37YRYtz3TlvPAWlrIh5?=
 =?us-ascii?Q?UG7KCvxDAj82RfXOQx+uEUlfDWrJqMCyQDRp1WkwzfNKgBBoY66erCs/k09K?=
 =?us-ascii?Q?9HH4uxEUXulgsLETg0XeVgkEkT1I/+mlTX3GJD4PhYc26ns5JDh8CpRTxFb5?=
 =?us-ascii?Q?cjWjllVLaSDnZ8xo9Rp2DH6FPuC4MdQeiwQiBBRLNewRTPJEYw9r17zRB5ur?=
 =?us-ascii?Q?PmxypppBoZnERNfNDt6/154pK4eB2t6EHeAdDrgl2Vmp0CkpodbYp5GP7OVr?=
 =?us-ascii?Q?ARVEH+chwpGQMGYmUUQyq1N0BaHCrYLOkEE7GSSXAEjYZnoqq0swJDxZxvNK?=
 =?us-ascii?Q?fEGZaCHrsZqhkZGmG5etc13OOTVwsy+CoqEZ/UsaLstvqKGtM4eXUT9b8IQi?=
 =?us-ascii?Q?sUKfZ7sU+ZHwBJ1nJcC9492O1PsggzwV9c5eag4HFRQ4j4rhTJLvXlU+RTwh?=
 =?us-ascii?Q?n5SUm7yF0zUJN4LlL5xyb7ge6nQTw57VoSOof2RG9qESWjYeQ51YtHVXw/dc?=
 =?us-ascii?Q?bsJNwYV4dyD0j5n1HHlmLsKkac9ZgaPr0n4fBl/fTI8TS16nvECdNkV0douB?=
 =?us-ascii?Q?u0k83S8TzKAVuDL/r/02eB/H4nAFXWLRz3oxkrFa0IhIi705KcmYEblk/XVn?=
 =?us-ascii?Q?Z7VoDE8efw=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: a15f77ce-e130-4630-2cfd-08df195f88bd
X-MS-Exchange-CrossTenant-AuthSource: PA3PR04MB11153.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Sep 2026 10:43:41.7587
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AvtltrNLulDHqA+p+0yjsKHAz01ws+LMZujcYzRGayBd+/E2KtB8TyfW/KKQWMAqCc9DKsSvibn0icELcncxzhJDfNVmg0PhyNUUHzA1KFI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8533
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 23 Sep 2026 10:43:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/10603



On 9/23/26 12:41 PM, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Trevor,
>=20
> On 9/22/26 8:32 PM, Trevor Woerner via lists.yoctoproject.org wrote:
>> The copy button matches the literal "$ " prompt, so on a block prompted
>> any other way it matches nothing and falls back to copying every line,
>> prompt and output included. Match a pattern covering each prompt shape
>> the manuals use instead, so the button gives the command alone whatever
>> the prompt looks like.
>>
>> AI-Generated: codex/claude-opus 5 (xhigh)
>> Signed-off-by: Trevor Woerner <twoerner@gmail.com>
>> ---
>> changes in v2:
>> - dropped the stylesheet change, so a mouse selection keeps the output
>> - the comment now says this governs the copy button only, and only
>> =C2=A0=C2=A0 reaches a block the console lexer has read
>> ---
>> =C2=A0 documentation/conf.py | 28 +++++++++++++++++++++++++++-
>> =C2=A0 1 file changed, 27 insertions(+), 1 deletion(-)
>>
>> diff --git a/documentation/conf.py b/documentation/conf.py
>> index 48d28a686807..313cabec05bb 100644
>> --- a/documentation/conf.py
>> +++ b/documentation/conf.py
>> @@ -242,4 +242,30 @@ intersphinx_mapping =3D {
>> =C2=A0 # -- sphinx_copybutton configuration=20
>> -----------------------------------------
>> =C2=A0 # sphinx-copybutton configuration
>> -copybutton_prompt_text =3D "$ "
>> +# This governs the copy button only. A mouse selection is a separate
>> +# mechanism and takes whatever the theme leaves selectable, which is th=
e
>> +# command and its output; Sphinx already excludes the prompt itself.
>> +#
>> +# It also only reaches a block the console lexer read, since that is=20
>> what
>> +# marks a prompt as a prompt.
>> +#
>> +# Strip the prompt from a copied line wherever the prompt cannot be
>> +# confused with content. The pattern is not scoped to console blocks, s=
o
>=20
> You say above that it only reaches blocks the console lexer reads and=20
> now you say it's not scoped to console blocks, this is confusing.
>=20
>> +# every alternative has to stay safe inside a BitBake or configuration
>> +# example as well; measured over the built manuals, each one matches=20
>> only
>> +# lines the lexer itself marks as a prompt.
>> +#
>> +# A bare "#" is deliberately absent. It opens a root prompt, a=20
>> comment and
>> +# a line of program output alike, and nothing distinguishes them -=20
>> which is
>> +# why the root prompts are given a preamble before this is switched on.
>=20
> Ask your AI to be less verbose please, or edit the comments by hand.
>=20
> In 10s I could come up with:
>=20
> # Only applies to the copybutton. Mouse selection is not impacted.
> # <insert whatever is correct for the pattern scope>
> # No rule for # as it can denote a comment, root prompt or command output=
.
>=20
>> +copybutton_prompt_text =3D "|".join((
>> +=C2=A0=C2=A0=C2=A0 r"^(?:\S+[@:]\S*)?\$\s+",=C2=A0=C2=A0 # "$ ", and "u=
ser@host:~$ "
>=20
> Am I right that (?:) is just to say "do not capture the content" (c.f.=20
> https://eur02.safelinks.protection.outlook.com/?=20
> url=3Dhttps%3A%2F%2Fdocs.python.org%2F3%2Flibrary%2Fre.html%23regular-=20
> expression-=20
> syntax&data=3D05%7C02%7Cquentin.schulz%40cherry.de%7Cb7040e79d7cc4140b6d9=
08df195f3dfa%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C63925756906894558=
7%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiO=
iJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dep8uCE%2BF=
E3tcdhzUT3Xt0wc4KdQytvOjxMP%2FUkvXtmk%3D&reserved=3D0). Is it *really* nece=
ssary, I find that it adds unnecessary complexity for a human to maintain t=
his regexp.
>=20
> EDIT: sigh... copybutton is parsing with Javascript according to=20
> https://eur02.safelinks.protection.outlook.com/?=20
> url=3Dhttps%3A%2F%2Fsphinx-=20
> copybutton.readthedocs.io%2Fen%2Flatest%2Fuse.html%23using-regexp-=20
> prompt-=20
> identifiers&data=3D05%7C02%7Cquentin.schulz%40cherry.de%7Cb7040e79d7cc414=
0b6d908df195f3dfa%7C5e0e1b5221b54e7b83bb514ec460677e%7C0%7C0%7C639257569068=
971255%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIs=
IlAiOiJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=3Dlo7H8=
RTXJ%2FjVWkfjWeOk7xuIapQowSevjLwFHmWwukM%3D&reserved=3D0 but regex101.com s=
ays the same (non-capturing group).
>=20
>> +=C2=A0=C2=A0=C2=A0 r"^\S+[@:]\S*#\s+",=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 # "root@qemux86-64:~# ", a root prompt
>=20
> And then you could simply merge the two first regexp into one:
>=20
> r"^\S+[@:]\S*[#\$]\s+"
>=20

OK this isn't what you want, because this here will match not match a=20
line starting with $ and if we reuse the regexp from above, then it=20
would match a line starting with #, which we don't want. So having them=20
split is fine. Ignore this comment.

>> +=C2=A0=C2=A0=C2=A0 r"^[A-Za-z]:\\[^>]*>\s*",=C2=A0=C2=A0 # "C:\WINDOWS\=
system32>", cmd.exe
>=20
> Have not used Windows in 15 years so cannot say whether this is=20
> appropriate. In any case, I'm not sure we'll have more examples than we=20
> have today for Windows as only the WSL part would use that, so fine with=
=20
> me.
>=20
>> +=C2=A0=C2=A0=C2=A0 r"^DISKPART>\s*",=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 # diskpart prints a prompt of its own
>> +=C2=A0=C2=A0=C2=A0 r"^pydevshell>\s+",=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 # bitbake -c pydevshell
>=20
> question: what happens to the one and only example we have of commands=20
> to run in a python interpreter? (remove the leading #, it's just so mail=
=20
> clients don't interpret this as a quote of a quote of a quote)
>=20
> # >>> from gi.repository import GLib
> # >>> GLib.get_host_name()
>=20
>> +))
>> +copybutton_prompt_is_regexp =3D True
>> +copybutton_only_copy_prompt_lines =3D True
>=20
> This is the default, but I'm guessing it doesn't hurt to make it explicit=
.
>=20
>> +copybutton_remove_prompts =3D True
>=20
> This is the default, but I'm guessing it doesn't hurt to make it explicit=
.
>=20
> Cheers,
> Quentin
>=20
>=20
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#10602): https://lists.yoctoproject.org/g/docs/message=
/10602
> Mute This Topic: https://lists.yoctoproject.org/mt/121380214/6293953
> Group Owner: docs+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/docs/unsub [quentin.schulz@=
cherry.de]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>=20



Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90910C3DA59
	for <webhook@archiver.kernel.org>; Tue, 16 Jul 2024 10:00:39 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.128])
 by mx.groups.io with SMTP id smtpd.web10.7351.1721124031870775167
 for <docs@lists.yoctoproject.org>;
 Tue, 16 Jul 2024 03:00:33 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=ajqeYtie;
 spf=pass (domain: cherry.de, ip: 52.101.69.128, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPFm7qvNZbyYSnmm7saGLyQ4Y/iwfEs4CUOtsSEOyghgBLWQ7PBQomgS0fy1DLvJwWm3afSStzKJs8W31KL8AD33TNq6exhKoUG6YVg7gWMEW9k03pN8QQbAcWDp9pHyfPrEZyHEvVmyccEGaSE07bsvEoLtgrQMe9Z65GQY+yqMd0OeL1uJ76NqjtKoEbv0S6wA9mU5bnIkYGtQoDD64Edm7B8MzUBnrx/75AZNFRdQHgQ27zJIugb2J6o2NGqsv0um6a+PF/qpcmwlhgl6E2N1kQ6zWK1s3uguaNsZvhmy/H6JBzpuNyfxj4K1hsKxTIrjqvQcwgoJZnrhnNW33A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FQHtc5RQtqT8ImsHmT0tWM8Jjm4J6sM0+hNFB6BxbDE=;
 b=W6freW0xeUsB72Ave8s9A3voGtn+R8nrSsPI+xTVbFWFFvKg/SFultM6lAsTGfjT7Lp4hP+4F99V1GKloA0evRoFifb6CMHPDBGlgSnuJarYspW18LCbuYK7TQ/EdpACMDRK+LoEvTDCBBGWHFOP9NgpvWZPtiRonWqAX9yqQ5a6AOGfaydeKO6vi3uid6e1g8HIOauy2zyAW/2/sgO+gT391s3U6ds69suhuF5VqqZE5lL+2erTzvNrnT/gLEq0atX06lrO6XjcmNfJw6ftM4Ax6E4WTIndbZvVwhiVomGG3JlAuDIbVlmvClG+Qw88w1ZU84u9ZJWMDWqLGb0QsA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FQHtc5RQtqT8ImsHmT0tWM8Jjm4J6sM0+hNFB6BxbDE=;
 b=ajqeYtiectMesC10mlB3mwSCNLwuL49BzOaCOrU51jjZr4FEg+D7NrWhfqaHvJsLUKowNYfrIYxLFGGsyRIk7h13bM3DAUZukPpl8T1V1kAbH6onsDQhb0mrbpYCfa+JxhqfrkMPSe4afVYVtthec6JEggHnTus1Sfy8/QXUH90=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com (2603:10a6:20b:409::9)
 by DU2PR04MB8503.eurprd04.prod.outlook.com (2603:10a6:10:2d2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 16 Jul
 2024 10:00:26 +0000
Received: from AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea]) by AM9PR04MB8906.eurprd04.prod.outlook.com
 ([fe80::d379:5378:b1:cea%5]) with mapi id 15.20.7762.027; Tue, 16 Jul 2024
 10:00:26 +0000
Message-ID: <54adf16d-730d-48b8-8d9a-ba6acb6f334b@cherry.de>
Date: Tue, 16 Jul 2024 12:00:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: fix typo
To: Matthias Pritschet <matthias@pritschet.eu>, docs@lists.yoctoproject.org
References: <20240714210908.3964010-1-matthias@pritschet.eu>
 <9506a52c-2d90-4889-b923-d66a124de971@cherry.de>
 <a83d7875-9faf-47ff-b786-698df9d3dd28@pritschet.eu>
 <0b7fe969-ced3-478b-9443-2d8a77e0b111@cherry.de>
 <a9eeebc4-9cd4-4d30-8af8-3225e554fcc2@pritschet.eu>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <a9eeebc4-9cd4-4d30-8af8-3225e554fcc2@pritschet.eu>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BE1P281CA0183.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:b10:8d::17) To AM9PR04MB8906.eurprd04.prod.outlook.com
 (2603:10a6:20b:409::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AM9PR04MB8906:EE_|DU2PR04MB8503:EE_
X-MS-Office365-Filtering-Correlation-Id: db99d6c7-cd76-4529-b70a-08dca57e1dcd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?9r2NUnB34c2g4d8b/cZ/rA0ggim4vqzLl1zNWDj9mIKdJpjLnrheihi0oBwX?=
 =?us-ascii?Q?jLIhsR/GXJ7gMxGV6iOPBx2VGCKcHK6s5ZU1ztZ3RDN586ktdpAClOgZedM3?=
 =?us-ascii?Q?5SGro9KS+YxTxF0gBKs7T0UJOJf2DpDH+/34gM54xOn3yHvnGoPwhEXqx7vA?=
 =?us-ascii?Q?jph40djteLHrpgib5vMM+HdKdg6oKzYZLw+o88KsTmMFa/tw5MGqdkVrbVpH?=
 =?us-ascii?Q?bqjlXqE49BcUhcsdYD8mIz3yrDO8MGr7n++sKhcbqnFDUEKroUMUBIJFcJIN?=
 =?us-ascii?Q?n8OMzxvcDBO53FAZbGhH/ZAd4WpxgR6jRED4Dl/wGRxGGfzm2bg1L3PJCVvT?=
 =?us-ascii?Q?QHrTT96jMLvZENM4qhpgk5WeFstR8aXU4vd3E2u935WvLaEGBB1TYmhUz2wX?=
 =?us-ascii?Q?ur/VgLusgHikoycTSnMaDyvwPVBEAZzcC1vkcF3/0IAhn+Or1RXrucnhjRHe?=
 =?us-ascii?Q?EmD4OExUPf/rb+N1PMBusoTMJLHqatYWewmPgVDr4OND3Z2Wala8VaNW1LyF?=
 =?us-ascii?Q?kVIkRmn5sRXnh7oSEcquOdpLMN5oyIFt72Xj+Xao+mP922IGzsfvTC5+obFV?=
 =?us-ascii?Q?zH2tbplHyrrQG/XGNCGTdu0luXQ3b9/O1Z7LOaXReCgUACAMQY1ZJIEfE/j2?=
 =?us-ascii?Q?vwryi1ufnS59XHTsH1umonCGC8bHJJb7ModzkGjOoX5had3DwEqI8B/tcE8+?=
 =?us-ascii?Q?/C8XCwMKFUp+hyyUFGVJa9oruQn4LEb3sl3eItwpTQfZk/g62rEMoYiEDloI?=
 =?us-ascii?Q?YaE8ubrqkcLGa1RPP4qbbcpkf0HyrK5jFVU+XcWtv2Gen44Z5UozVJZSjXwd?=
 =?us-ascii?Q?gtqOLDLC8T4Zbrvltm7Iey2ydP1+4YQsHwPDCJa9lS95gL3CMLqZmRQo3/c4?=
 =?us-ascii?Q?FuSIUmaw7oxzGUXbk9qi/gZSFWM+NSlJrl/HCFXQ4uUp+jbWnTFgsO3bdLKV?=
 =?us-ascii?Q?99MJx8ArJug5V87dQIGN5RY4icq8zOe7tFVhrThG+Yf1Dptb+oVnHWbV6sSd?=
 =?us-ascii?Q?wVIFTKj0RLcyZCSD2FaTRJ5vYhSotyRxbHzuLD3YPmAaCD+EHlw0haHD2drV?=
 =?us-ascii?Q?DsprGPuDwsTQO3+bq55EfgPKHScwzAGNbiG6Pz3q3mrFwgyx0pSTI3xXQd6f?=
 =?us-ascii?Q?KSA1gQj6I1u9PLin6kdSrGmomMmr9j/RwOhAojjEArhcl613McAT0jE4PhAM?=
 =?us-ascii?Q?DoooZd/vTyllcDgdYZzePSLZj54d7Zn97+Szf5e+SOOFVHrUN2cKD3FFK9Vd?=
 =?us-ascii?Q?X3Q1vDkDMwk/mXef6npIOzDoLhBnuby4T40cwQqV6sOJChMHw6ZTOO3QZ3ZM?=
 =?us-ascii?Q?sMg=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM9PR04MB8906.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?EtEa5NyhfrcRwHnuDGuSCrudTJwpWGm8tyyNscQNtQdx2dM7b5UxKQ7tz/OW?=
 =?us-ascii?Q?bL7vBj/kWitQLshdQTYeos0JoxCjR0bqxdR6O9GrWLZsAX/AhbdHlQmdEmxv?=
 =?us-ascii?Q?QdEwFxYCenUtmOAOkeTBxAVdWrolCg8xxGWqnVCzvMjxnY8RDVRQbtUZck4l?=
 =?us-ascii?Q?jSr3FbSNXPHb0rsBQEv1JejO+KoyRU2vZfUJGs8A4eRHErIePrl70gcJTq07?=
 =?us-ascii?Q?5FUM0VyZqoaGJdXybIUFG9YEaYctdtH+SN2TDVsplbBV0G3syIetpisu46yt?=
 =?us-ascii?Q?1PFIs3WFzhQ9/iu640i1gLASJ7H5o3ov60cHL97lSQXzGLBpb9X99Apo1GZF?=
 =?us-ascii?Q?uhLOGyTmL9ArYlNXEEKSz6GNYadSb0uSItFF8enqBVT37F/n1k5XXViBYvXt?=
 =?us-ascii?Q?8htdPUUnUxWDAb/gIx4vjl8mcoWBQEXuMt7Bg8+oDYv8DnjVmeih5RqnQCAU?=
 =?us-ascii?Q?WMGp87vXQgXTiZ8QwLWjzG2rqZH5hXdDRNqA7mNqFumNA2CqVmwpT1rnVJPg?=
 =?us-ascii?Q?c5utc1fHjOYA1JBPg4NxXoChN95E6HgerKyTAEp49cq75AolCKMcqg7bNAJQ?=
 =?us-ascii?Q?AC0LJDM+VeKyfHVfnjRhxBKMoXfgOrBYD0VBOkohEeI08LPd+k95jVkooeUI?=
 =?us-ascii?Q?HBUxKGJuBVALxqjXQrDY0V5kHs4bX8O1unMDKMUr3A9uD8b0jpk1hPi1DtCd?=
 =?us-ascii?Q?y6vUV/bR5IoSlCEUzWJ4ywXw560QB2g6dvI263znmhxUBX1cJexcVGlftPWa?=
 =?us-ascii?Q?aKlfP6Cwd7s5wyR9HIQhfeYYY0Oko46GcAZhYMyp9SIW6MytgfCHHFfVxA5y?=
 =?us-ascii?Q?VNxDmBoFO6VaytaGB5cuWIDbkaDaV3u6Pkj+ZTzELJwcoGe12fjhubb9scql?=
 =?us-ascii?Q?hrZ4Jnet5hMGStrVxS2o/HlMYda8NGzyw35v73dcrwuwxcFya8eNH1SVcAiQ?=
 =?us-ascii?Q?GRdizjL5OT5eu5vVjnBS9Knt+oA53UOjkph327V5p6qlL9H3tMnf5sKw0U6e?=
 =?us-ascii?Q?HZqk1E0j/v7tMItr5DR7xR85xFRRxCReP9ofRXkmOhGxbT5tBu9uOOO/A+ju?=
 =?us-ascii?Q?XGJsWPDYxI2gzfW6RzLvl/OX5UCBjcMq6wBDoQ2oRH9merZnYU0BYwN1NxJP?=
 =?us-ascii?Q?2vK0IC5x/IvG67lwK7h2zA1Np7aYbVpjyZDlpvGJG6bwLAX90VJhVxLCcy1T?=
 =?us-ascii?Q?xiYtrfp2zs1zkNTNcVMkqB2Mi4ilJqekdN08u7qnVdtpYqz+If32fzL5Qwi0?=
 =?us-ascii?Q?Gbvp92+MzvEi5ssRSbd9R9CT9P7dVWdTb6G+cOIRzJr5TEoOevhBXG4NqXzC?=
 =?us-ascii?Q?F5Ydf2JNcCqgWCzlQrNuRXlyayGuDdwvLEF5JgRcqVljQUW6M3Zr49rc7wjx?=
 =?us-ascii?Q?ZkijhvdJm0lH4yanfOJ/vzmi2vRCdXZEQab989zInVJZDBhJ89lE5gQbGxAe?=
 =?us-ascii?Q?HXL6+ACXvhs5frf0MfGyHIJQm5G7j1Aimy3Pc13jH3rC0h5EOtJ/Q7qfWPei?=
 =?us-ascii?Q?O66z1cRD/FBbiDu7YqM/WoRQm4DNNyaXV3DjZgQQlbf1/x1yNTw0M3LMwAm7?=
 =?us-ascii?Q?uNEMLKjzrhN5fZuoQTTU7UJ+hDNW6Wl8ILJKlkjhA8hKR7MOol4fd6Jm1I6R?=
 =?us-ascii?Q?0Q=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: db99d6c7-cd76-4529-b70a-08dca57e1dcd
X-MS-Exchange-CrossTenant-AuthSource: AM9PR04MB8906.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jul 2024 10:00:26.6411
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KQj4WL3OqNEG30qPop/gSbiDb/8xpAEoVKQmQ71UqPqNVYSoN5yypYieDaQyxIelY/Ch7/Fj37Lsw/pMOfGAWyHcoIK5YH2zitpU+aPL+gI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU2PR04MB8503
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 16 Jul 2024 10:00:39 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5320

Hi Matthias,

On 7/16/24 11:48 AM, Matthias Pritschet wrote:
> Hi Quentin,
>=20
> Am 16.07.24 um 09:23 schrieb Quentin Schulz:
>> Hi Matthias,
>>
>> On 7/15/24 6:14 PM, Matthias Pritschet wrote:
>>> Hi Quentin,
>>>
>>> thanks for reviewing.
>>>
>>> Am 15.07.24 um 09:45 schrieb Quentin Schulz:
>>>> Hi Matthias,> On 7/14/24 11:09 PM, Matthias Pritschet via=20
>>>> lists.yoctoproject.org wrote:
>>>>> [You don't often get email from=20
>>>>> matthias=3Dpritschet.eu@lists.yoctoproject.org. Learn why this is=20
>>>>> important at https://aka.ms/LearnAboutSenderIdentification ]
>>>>>
>>>>> changed one letter (s/B/A), so the sentence is correct again.
>>>>
>>>> I believe we need your Signed-off-by here, c.f.=20
>>>> https://docs.yoctoproject.org/contributor-guide/submit-changes.html#im=
plement-and-commit-changes
>>>>
>>>> """
>>>> For each commit to create, use the git commit -s command with the=20
>>>> files or directories you want to include in the commit:
>>>> [...]
>>>> The -s option of git commit adds a =E2=80=9CSigned-off-by:=E2=80=9D li=
ne to your=20
>>>> commit message. There is the same requirement for contributing to=20
>>>> the Linux kernel. Adding such a line signifies that you, the=20
>>>> submitter, have agreed to the Developer=E2=80=99s Certificate of Origi=
n 1.1=20
>>>> as follows:
>>>> [...]
>>>> """
>>> Ah, sorry.
>>> To my defense: the -s was not mentioned in the top level README. ;-)
>>>
>>
>> Which top-level README?
>=20
> I was referring to the command in=20
> https://git.yoctoproject.org/yocto-docs/tree/README#n19 , but it only occ=
ured to me now that the -s is part of the commit command and not part of th=
e send-email command.
> You can ignore my stupid comment above. Sorry for the confusion.
>=20

Yup, cannot add the Signed-off-by tag outside of the git commit command=20
I believe.

>>
>> https://git.yoctoproject.org/yocto-docs/tree/README#n13 points to the gu=
ide I sent you yesterday.
>>
>> Mailing list contribution is something not everyone is familiar with,=20
>> so I'm trying to understand how we could improve documentation around=20
>> it :)
>=20
> As you might have guessed, this is my first contribution to a mailing lis=
t.
> I took some time to read through the documentation because I really=20
> didn't want to mess it up, and look how that worked out... ;-)

You did pretty well for a first patch actually, you're not the first to=20
forget the Signed-off-by and won't be the last, some veteran=20
contributors forget sometimes too. And you even had the v2 in the commit=20
title for the v2 :)

> Also, I just realized now that I should've had put you in Cc: of v2's=20
> commit message instead of using send-email's --cc .
>=20

Nah, it's actually fine this way, we don't really make use of Cc: tag in=20
the commit log. Adding people involved in earlier versions in (mail) cc=20
of the later versions isn't required in most projects I contribute to, a=20
nice thing to do, but not required (I rarely do it for example). One=20
thing to do though is collect tags given on the mailing list, e.g. if=20
there's a need for a v3, it'd be very welcome to have my Reviewed-by tag=20
I gave by mail on the v2 make it to the v3 (provided the content didn't=20
drastically change of course :) ).

> It's all there and well documented and if things are unclear, there's=20
> always the IRC.
> But it's just a lot of information to process and it's easy to forget=20
> little things once one is done reading.
>=20

Yeah I get that, but again, you've done well, don't you worry too much=20
about it :)

Don't hesitate to ask questions or for clarification.

Cheers,
Quentin


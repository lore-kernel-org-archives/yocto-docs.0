Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DC02CDB474
	for <webhook@archiver.kernel.org>; Tue, 17 Oct 2023 11:41:08 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.45])
 by mx.groups.io with SMTP id smtpd.web11.210776.1697542865599557632
 for <docs@lists.yoctoproject.org>;
 Tue, 17 Oct 2023 04:41:06 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=ZGRxmUpw;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.20.45, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SN/m2WoXpdai62diuGJ5xdlO+hoWY2qoWbdDFVyY8xygtx3kPg9GKDO85t4WaetyzJdBfRVK2odD669ml90FyTuWVarGe/qxw0p2DUPihWX03rB2+1guX9OEOETcyOCAx+pKQboOSMchsxEh4Qqta9cV9k5BO14ao7YjPLxaj1bAqxPjePSoXPZJFmqW0azWSEuXcoGKbZIQahEQbmLm8y9SybC7789lAlrwN8soKCbzpcVxBOvTUklZGRzyDuhf8J8gD8Knk50MHuDR6Af2e4irrNdt2utvCJlRIzxjS0NZhUPeNRs08CN7x+fivXRhbWQYYDABaeSLMZRVDm/6ww==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZLE0fMGBD9X59ZfvMLw0mup+9CqV9q2VOXvWrJFsdDg=;
 b=PMbQ33JimU2L8q81WHs3oHnKpH7oPZZa56FoAowNT7IFmMfaeIAcyjtcY6NLOSR1wg7MzI4ePUMO5VDiBPQx4ZWA6oJUxt2Hdaw7+b/t8AMc1yM/TQoiketBi7eYaBQvmW7WP++PzrLhkezDT1wbpX3p9Kprvmn4to/E6Qr4jn1NGlnNwQjTDpyjdYn1No2OGIBN2Jn84T9ifShmSt55ggCreILhrSgQgUwOkBeQS6oE/Am+wcc04hdOn2qZe0ycrhlCjwC/Fee5lDqldYu6fpeldtBjl8kWQaEev+IIzoVvAaDTdi4DePvYz/UIFK2Bn+7sl4e41NXbz3pPODY6UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZLE0fMGBD9X59ZfvMLw0mup+9CqV9q2VOXvWrJFsdDg=;
 b=ZGRxmUpwoBEpEBCdZwiZ+RWF0mb/wdHaDUfL/Qjf/N1umPD5cKbgl39TpRYfe8ZRp0jSpIvcxEPrhAxKd3o6wK0m7hcti4igHE3lyBPMiqsKEFx7fJsttnDdzf646XhpRO3TpAftnUwbK1yAYkdDBXdoYOqj6P5j7IwyJMfN38egddEkNL8tpMrg+UGlywdWh0elLqL0A+Ug3fRXWSsvywEUmyECRXEvXy0RV1CBvtgKnw4cPTeM1Oc9eR7eipC/pneukKySGejsIE98dVwD2EtZYXu/EkrlvhW1UVDrnaOSafrJHPp0gE+vwKhPbrCG/6MeHyGeRvWy+cyxw/AwHg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM9PR04MB7682.eurprd04.prod.outlook.com (2603:10a6:20b:2db::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.35; Tue, 17 Oct
 2023 11:41:01 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::a05e:353b:a447:8152]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::a05e:353b:a447:8152%5]) with mapi id 15.20.6863.043; Tue, 17 Oct 2023
 11:41:01 +0000
Message-ID: <3217e2e3-6732-440d-a390-86b9074cc6cf@theobroma-systems.com>
Date: Tue, 17 Oct 2023 13:40:59 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] ref-manual: variables: provide no-match example
 for COMPATIBLE_MACHINE
Content-Language: en-US
To: Michael Opdenacker <michael.opdenacker@bootlin.com>
CC: Quentin Schulz <foss+yocto@0leil.net>, docs@lists.yoctoproject.org
References: <20231016-dev-compatible_machine-v1-1-6528e1c98611@theobroma-systems.com>
 <6c3a40d6-2881-4697-86b2-0b26ce3feb76@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <6c3a40d6-2881-4697-86b2-0b26ce3feb76@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR4P281CA0083.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:cd::8) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM9PR04MB7682:EE_
X-MS-Office365-Filtering-Correlation-Id: c13503a5-537d-4392-f5c9-08dbcf05f018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	AfW1KoxitVsF1rKhBu348bl29ph/kCyNG/SuJAY8Cg0D8l3IipOWsfxdHH4GqP4jeq0aYoFJthNXzumKTlDvZTZq+B1s5TBeVWovzWbfAmd8EXmQj6HYSkuDOPpBMhSXNawonLtPxkeF6dUpdJ7O0damvOGhdIfukqvupfmtzhQcMddp2Rc7Xs6RX7/SGeyUJqd+RKtYJshV48mWk7CSFrwnLZJNs6vd0t+bqteXPjoqBg7wV0O5W2M+yBLXhdmkaIJn/+MLyp//elJ781BdAHjyJE9FIx2P9BIih3wLgD7Iqfvu/MLr6KzPJtLtnbVfxkGKNVrfDhaaOSAFlWrmBSSOge0x8c4Vrfd8DKDcuihhnNTReNbi2GKHN8sdsNt++4+faHGPXdQjJq8OJXY24zc6ccAWcAUo2GMLWFKRbbV6/eH+JebETLo7h7PnkqkzhWZLEvox5/NRXPhp0DEDVqYxE0GoN7X9KQVUSCvQhEfTrJrPOh24bfCyhaTGENVPDVHOzyASKTpev0xgInD1pxXhmokibn3k7tYkJdc9MtDEua/ZtZmDkAQwHt1au0WCOa6HrJvYZKa/eu7k/GKNw0NT/djK6clVNZUFQIOzuw1aKQM/n81Wzdo9OFQbeXTMApHDbsUK36V3FXbkuIciGg==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(366004)(396003)(136003)(39850400004)(346002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(31686004)(66899024)(478600001)(66476007)(6916009)(6486002)(66946007)(66556008)(41300700001)(31696002)(38100700002)(86362001)(6512007)(316002)(2616005)(26005)(6506007)(53546011)(5660300002)(44832011)(36756003)(8676002)(4326008)(2906002)(8936002)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?Cn2vjyC2SWXeUmIa+inNzUWm8OHkfQYHwweOVmOhyFts+gT9H9f5EF6qnyaI?=
 =?us-ascii?Q?0SZfcH2HjvpOIeQ//fU90oSxQsfO5Fo0yCFBVU/2NvA22SN+vOkEYWn6V62L?=
 =?us-ascii?Q?CB0KBr18U2gqczXqJY8DeCSRTsb9+9Or1A66zJU4FURvECDkl2ExCcvhkvcM?=
 =?us-ascii?Q?GrRwztPWMmV4iqF7rrYn2DBsXEFtqup/4YJXmxLGJn5LRMDAFuNUCT9MD+ge?=
 =?us-ascii?Q?QAHTiDbdHqBI3iVyfuM2qWxabb0WQUgp9iVudy+J5ZSUHP7u01qNovup2pVO?=
 =?us-ascii?Q?3n5kEzJBHnDsUsSdUvLj9+rj0i1eIHvzFO5Ect7yC+bRnEyMHnUTsKkHSMkw?=
 =?us-ascii?Q?VPJMvR6bYFX/t/7JgZnSgqFJFwx894WXh2RePzXI0F7lBCmM70+keRD4q7tV?=
 =?us-ascii?Q?YD+z7DOGcDoqR0+AcvW1qdWKcZ/s8wVBhGhyNwekDII/pRrh/mQhfrovhT/H?=
 =?us-ascii?Q?SlmzFAaLvjQu/ZuSxwCG9SGwqBJ432jeJnFXbedbwsejNxNj1dD7wMBsflLf?=
 =?us-ascii?Q?Xnk3aFjofuHK/JL2oUdbrqcyCVGMYFqUzXtViGPksD+UZ9W440ZMQR/z5yiV?=
 =?us-ascii?Q?3Z/3VPKmGLs8P8aiMruFS7Ypmvi2P2AM579auyWXXn3HPAb6+vNm+LRzLd23?=
 =?us-ascii?Q?GO20j1Sc0HDKriRw1+BJPXefgRqbivkoAxLzJgBxnmNjpD4ywqbkzc2LvPHr?=
 =?us-ascii?Q?kQS9BtaI65L0A11l0cyGDMZm7v8psqRqTRlNekzSkWlfpo0u2otw16iJ6s47?=
 =?us-ascii?Q?qbjx+bI5RgYsFYNrLE5fbKzQWerkzANITp/e2b/v3hhWb0IEqA7X2WJQfits?=
 =?us-ascii?Q?aonjX0GrcwCJXzVN/Vw/frXh9z+YiCM/N8vJWP1mG+XjYrcylq4DVNLyo0/c?=
 =?us-ascii?Q?EJymo9xLeCRLA6YhQ7E91lTLR8txn3tdCqMcJe84FV+ImDte7f3jwNvzhGep?=
 =?us-ascii?Q?ArPn7axQK5qHyYItRZS9XpPCOI7ufkKRLhAZRiG3q/ta/JxI118TuD0C/Cd2?=
 =?us-ascii?Q?kuNNf6PQo1ZPbO4ZodWCz7H/GvPAlAuWUKhnyMjIxQg5p+5XPhxjEnN4wugr?=
 =?us-ascii?Q?TTvOkDAZWV3AsruFiFvTOn9ve0dkpiCpXa2LyDdeJGoFyX3WkjKQm+15Aozo?=
 =?us-ascii?Q?6ZNK71y0SB4UGyuV3pvtt/QGLbwLk/NB9H0jtJEQEC5q3MmuzX3rk7NE2zfN?=
 =?us-ascii?Q?WskoIV5DSaXA+2IXiSzrzZOzfuc+y9WVriYvBPmWa4TEbWd88CAhvGxml9Zb?=
 =?us-ascii?Q?H7zduOjTpTdbBslfYNQuFoeGPLm1L1Z7CONwmpnTKvOCO0SSTBX4Qc6J68wo?=
 =?us-ascii?Q?tkFkngeOJFqyEtnuMb/Pie/MAxKUaf5sPh4fJnEr9MDQolCQxWune3MkKkyq?=
 =?us-ascii?Q?j404E2SlSsF2C5tsyhVfnjv8sm6sn8TmRdrP9RAH4N8TlLihlcGSPztAGiM4?=
 =?us-ascii?Q?m7ollmzM7JyQg6+uyOnbZ3c1W5sB+joCIWVku34SRoaKBxGu7pjq72tBJJff?=
 =?us-ascii?Q?wtDDRsbI60J2f6rWnEFpiep3TjWO6YcDyTf2VG+au93U54+sTRdeREbQ/+pf?=
 =?us-ascii?Q?IsuyERiw17hPEwldcKQ45fJWhhSZ83Mf9F6+Ur5/7ue0ezI566VqmXZwjVID?=
 =?us-ascii?Q?g8JBCafICiNuUnydy2IxIHE=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c13503a5-537d-4392-f5c9-08dbcf05f018
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2023 11:41:01.4879
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0si1WA7g7I57MC7hvk1jLjg6NB7Y0yAXxUddjEWEOKCESAZT1elkepQS5pm4T21c/qRrmfRMiJcfCSIG3BXSM8kfeZq7nroLkP3VwmMGDqjtPScfX6aE3nOSedYEgRPT
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7682
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 17 Oct 2023 11:41:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4393

Hi Michael,

On 10/17/23 10:43, Michael Opdenacker wrote:
> Hi Quentin
>=20
> Many thanks for the patch!
>=20
> On 16.10.23 at 14:16, Quentin Schulz wrote:
>> From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>>
>> COMPATIBLE_MACHINE is used to forbid the use of a recipe or its packages
>> for a specific set of machines.
>>
>> In some cases, it may make more sense to have the logic inverted and
>> have the recipe always forbidden except for hand-picked machines. Such
>> could be the case for pieces of software that only support some
>> architectures. In that scenario, it is sometimes a bit easier on the eye
>> and for maintenance to use the OVERRIDES mechanism but for that, a
>> default should be set.
>>
>> COMPATIBLE_MACHINE:aarch64 =3D "$(aarch64)$"
>> COMPATIBLE_MACHINE:mips64 =3D "$(mips64)$"
>>
>> wouldn't do much because if COMPATIBLE_MACHINE isn't set, the recipe is
>> assumed compatible and therefore, if no default is provided we enter
>> that case.
>>
>> Hence, we need to add
>>
>> COMPATIBLE_MACHINE =3D "^$"
>>
>> as default so that it only matches the empty string, which isn't
>> possible for MACHINEOVERRIDES.
>>
>> Cc: Quentin Schulz <foss+yocto@0leil.net>
>> Signed-off-by: Quentin Schulz <quentin.schulz@theobroma-systems.com>
>> ---
>> =C2=A0 documentation/ref-manual/variables.rst | 20 ++++++++++++++++++++
>> =C2=A0 1 file changed, 20 insertions(+)
>>
>> diff --git a/documentation/ref-manual/variables.rst=20
>> b/documentation/ref-manual/variables.rst
>> index 11523bb9e..370b5bfbf 100644
>> --- a/documentation/ref-manual/variables.rst
>> +++ b/documentation/ref-manual/variables.rst
>> @@ -1358,6 +1358,26 @@ system and gives an overview of their function=20
>> and contents.
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 speed since the build system =
skips parsing recipes not compatible
>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 with the current machine.
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 If one wants to have a recipe only avail=
able for some=20
>> architectures
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 (here `aarch64` and `mips64`), the follo=
wing can be used::
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 COMPATIBLE_MACHINE =3D=
 "^$"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 COMPATIBLE_MACHINE:arc=
h64 =3D "^(aarch64)$"
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 COMPATIBLE_MACHINE:mip=
s64 =3D "^(mips64)$"
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The first line means "match all machines=
 whose=20
>> :term:`MACHINEOVERRIDES`
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains the empty string", which will a=
lways be none.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The second is for matching all machines =
whose=20
>> :term:`MACHINEOVERRIDES`
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains one override which is exactly `=
aarch64`.
>> +
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The third is for matching all machines w=
hose=20
>> :term:`MACHINEOVERRIDES`
>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 contains one override which is exactly `=
mips64`.
>=20
>=20
> The text looks good to me, but I see your use of single back-quotes such=
=20
> as in `mips64`.
>=20
> Was that a special choice? In most of the documentation, we use double=20
> back-quotes. You can check the variables.rst file.
>=20

Ah well... that's what muscular memory does to you. Inline code=20
"highlighting" in Markdown is done with backticks. GitLab uses it, Teams=20
somehow works with it, Atlassian tools as well... and I forgot rST works=20
differently and didn't check the output of my patch.....

So no, that was not desired, rather the outcome of the lack of check=20
that shouldn't have happened in the first place, sorry :)

> Would you see a case for using single back-quotes? At least on my=20
> machine, `word` produces italic text, while *word* produces boldface=20
> italic.
>=20

Nope, consistency should be our main goal, so double backtick it is :)=20
v2 on the way, thanks for the feedback.

Cheers,
Quentin

> Cheers
> Michael.
>=20


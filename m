Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07747C001DC
	for <webhook@archiver.kernel.org>; Mon, 31 Jul 2023 09:08:16 +0000 (UTC)
Received: from EUR05-AM6-obe.outbound.protection.outlook.com (EUR05-AM6-obe.outbound.protection.outlook.com [40.107.22.58])
 by mx.groups.io with SMTP id smtpd.web10.3425.1690794490237934357
 for <docs@lists.yoctoproject.org>;
 Mon, 31 Jul 2023 02:08:10 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@theobroma-systems.com header.s=selector1 header.b=Q3Ksy8xh;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.22.58, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=byF+LuA+gYPa7VsE2FQWlVSl50Ragv63kXK4wnfSNEGZKRP8llpPSfedii9CWe3qVk/pPvgBSOs7j54fUKlgZIQyidUY+gRLuzc4JdRnolawRJvGIIaPGsIzgKm5yOAsavV38yoStqlyiQkIk619kX4YnJS1EEO2oPmRVntv33tJTS3nPodLKyuLkb0VNWqdj9csxSGzOwDI+Hvja1vKHkYxxAw/c5UmVp4Q6Bsm0ejrjyAZ2DRi+Y1Azmvb4ToFjCrRzp0sk/xPQnEqo4sPOAtNtQnLRihSbqUAfB7eB9aDl/FGHoHWxnDWbKreoMWalY6Y2/IXh9WfZUlpO8MB1w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rWJVSU5hWzqROvnD5DNBgcKHOz/nT1DlGd8HXK0uH6k=;
 b=TvocyBEsZmk4ntT4gCr8jP5rboCwIcQv3RVtVaq0CXr3xjdscyWjPR7n4mf6LhVOhNj5rq9aoy10YuYmpqiJDnNRon935jR+Oy6oCP2PSz0qRC/7TGf36fNVXJvJk6R8MHKqvd44t5R2sFcfbCs4VbqLv/Ms0RosekXQw8zC0axm6ZVnMUEW5us602NT0fIyc3sEGtdJCMJxF3lYLjM5qRorGzG/ULZG+jBwPBehdZfP8wQL/Q1q9aRMaELKiuN24IoB9N9hwKIRuI1D6fNPaqRSxdLdKHAlZADPqD8tCo/ZvziCHMloT7YBqL/3J7Zb14uZ+8wMnDh+YiLRSS8FMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rWJVSU5hWzqROvnD5DNBgcKHOz/nT1DlGd8HXK0uH6k=;
 b=Q3Ksy8xhOFxr5538syBZlULgYrzGexFKMhtEubsLeV6z/PSkGJoGi6HB4AVACdO3o0zo8/I4J897LtxtBe9Z5xxX2fRczNkeS4hCgtw2+pN0P07Dha6UQFU0HdYV/thJSy1B1MAgxhDgM2BT997wM+8FCnCO3Bcnv2sb2XtT0gLN6YbuMySUUGGulo7LnOc0aj6T2F+j8mqKRfol+HypgBpPyph6tzHzTccW5LI7kwTbkY/ib9a0y3snsX5RUFYRAviVvkEnqPp3MQbv4AqyM7/wK950KJxeD4mugto+WoBqSB4aydUxcRdzwqOf0EaTRaWf0MBc/b5BIPEkBdcazA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by AM9PR04MB7681.eurprd04.prod.outlook.com (2603:10a6:20b:286::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.43; Mon, 31 Jul
 2023 09:08:05 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::dcf6:ae13:fdf2:13e1]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::dcf6:ae13:fdf2:13e1%3]) with mapi id 15.20.6631.043; Mon, 31 Jul 2023
 09:08:05 +0000
Message-ID: <5bf9f81c-f72d-7af9-1446-a29fe887ac7b@theobroma-systems.com>
Date: Mon, 31 Jul 2023 11:08:03 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [docs] [RFC PATCH] WIP LICENSE_FLAGS_DETAILS documentation
To: michael.opdenacker@bootlin.com, Ross Burton <ross.burton@arm.com>
CC: nd@arm.com, docs@lists.yoctoproject.org
References: <20230524163201.3630288-1-ross.burton@arm.com>
 <02d5ac9b-c4eb-0d60-d812-4128501d5473@bootlin.com>
 <5f1d69bc-496b-1a43-3b02-f73fa9ee3b38@theobroma-systems.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <5f1d69bc-496b-1a43-3b02-f73fa9ee3b38@theobroma-systems.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0204.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::13) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|AM9PR04MB7681:EE_
X-MS-Office365-Filtering-Correlation-Id: 9236f0e0-a89d-45a3-eae2-08db91a5a654
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eWN2ufBmZ4r+QFxJ/trNtCR1cOhhILMcvALCM59WmmczmGMXCzNML4boE3TD5BRr2FopNtXYqnKrKlIXVJ0HWSF8nJd1elJ2+uqAgLgBICwKf+7fnEWkCpT7kMoaEpgbnYDQ8AFtkc4OsuxLfZYEUCEZSjbvg/gGXdaUJDK+vxS0hvm6UZdLo9UzfXEdEbx/KOSQnhGnBr4Q9DwziCg7P0/TZjlJZdxZ2wnEjRTQNWgaVc2WST96oGq1oeCMskXDMcnpwqPvpnVQf+5RZqdvOlDgvh6QRoY+gvPfmUNa7D/3/08y0kMSL8x9Na69/InNW1G61z7H+fKefq9fpyI38X9bIfbebJqqh2ZQP44Jgd/lSqOcLWfFx+OuBF2wzi3zyTV9caroqRntt7yE86PN30iNTq77p3VHVIARDFxpJ9sER7VEWlw9xxCrz0wun8w1O4r33i92KMIKjHDohB/I4VIlOlK97oC3w6Au5aVxwCZQIVthifj+3EifF1VnD4z4R/zgyh16KzXZqQg8XR7Yajd0XumJrf0UJBJ89v6NYaGrvgs6A0hY3BpHk08UirLJsPXUvgpqO5XdEaBSXt6UgjqXS0JoP9kmbLYS4YRGiW7fTVKkOGDCWwYmlvVK27fGyKrX2VVcSyqVyI+BthkSbA==
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(366004)(346002)(396003)(136003)(39850400004)(376002)(451199021)(6512007)(966005)(6486002)(36756003)(53546011)(2616005)(6506007)(26005)(83380400001)(186003)(44832011)(66946007)(66556008)(41300700001)(31696002)(86362001)(66476007)(316002)(4326008)(5660300002)(6916009)(8676002)(8936002)(31686004)(38100700002)(2906002)(478600001)(45080400002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?YGpgQnkfb7XlNP89qyYLU6j2A+oSiAmoYbovb3VxtFnH5h2/rGKYECBiOAWj?=
 =?us-ascii?Q?F4I+HZrH0RwuD4D6HWudhpkcA2OuvPWhTxnnZeSAbfbldpq2fyqH7h3D0UOG?=
 =?us-ascii?Q?hatspLTWIAlIvUoeMu9wXwO2nhQUKPi/XoIyc8X8UjiGvkjmA2ouDlIXkycq?=
 =?us-ascii?Q?Zt3cIToij2qUHSlEOLck5of3m/Ay4nhGS5F2qyXytcszUjK+Wt5Yz3WqSfW0?=
 =?us-ascii?Q?8UnkraJtiI90PfqxHKFbjUbrYNe0WLbEGJi6Dc/n7RCoHj1PDnR/OBWMetIz?=
 =?us-ascii?Q?tWv3pcW0tnY6F1RIf7IkJHjIy42UNwhJgoR/gIIk+LnBY76yL1Tma0mXwUbB?=
 =?us-ascii?Q?rQas321WwBDpEksShk8ivqptPG1G4LptgXvbmFxAYlSgcmAYsrs3qY9qz4gD?=
 =?us-ascii?Q?fC/ajMEBWeoP6T4g5MUZc/N/XSLLBgfOy5EgKzepm9dMCbdwfLnNe/km4vxR?=
 =?us-ascii?Q?XctsXsn591uOZ3USk0AMofrqZYvK8bStA1oWrnCcNfZut4MTWUhsLZO3WAYT?=
 =?us-ascii?Q?lRV4qHrElarsDMI5UV5CGvhM69WZ5cRZX8DPPaw+j2g5o9stHOAY3d3buos/?=
 =?us-ascii?Q?ZW1uQdkgks+49yyMDnx0mmfV70ZpKotro2/sYGGxrtZlD3L4FX6cW6K5z7ug?=
 =?us-ascii?Q?Canbm3pDYM/xxL5FBmlVvFp1nfzVT33VcZGUyRwKs1IiYrem8YbQgG4mvTgu?=
 =?us-ascii?Q?d0stAQ2eFB53rSUXoxKK6iuRzWAsI1CUy5rUBG97hy6dpfS7QlPSBvI1nMek?=
 =?us-ascii?Q?0ZO5tgOKe2C1PGj0LZXOgqg4fL58j/RHgSXybCHZ4dY8BFbGVGV4MgYekpZJ?=
 =?us-ascii?Q?l+eKVR0ydnZlIxArgv/yqrjFQ77z+ygyktUDV8Gnp/rhNTku1RlHZOeLTruI?=
 =?us-ascii?Q?oRSgTuYwAemlankOge8eFbg2T2YcZHVgLpBDp9BdWfh3LZh+vV/eBkrmsGT5?=
 =?us-ascii?Q?xVCmQ8niBWsgP/Y3RCWYSE5CrToheZRZbq0MIf8c4NOQXbUSnm6pLQow2uvm?=
 =?us-ascii?Q?mkI5FgxaCue+g2E99ipoEIcv1h+ROxWatEqSLofq/JeU5o1xteSXYjOKJjik?=
 =?us-ascii?Q?ITx7DHxR49rlLZE/w9B3E+NPlC127ihwJcto+DAMdoFYDuMfWs7ZRbdifxfK?=
 =?us-ascii?Q?hDkv32dEzrZx/QDBiLuz1kzEDmvkm1pceERQqwpBGE/3xnSq21u4n5XQxhtH?=
 =?us-ascii?Q?0onEyvDfC9hQYzt2DJQvMzRL5Kq3cAMEtNfBPTJHH9i3ecMxUb4JNr1+O3cs?=
 =?us-ascii?Q?cflV6z32fdp9WJ52RZGIukU8A8R+Dzm8Wu97jOX3Gvw1wso2LXz3SW371eR6?=
 =?us-ascii?Q?LHYFIsF9LngoiqdwYh+Kh690yjY0AjiJlvZKyD59kLujtNCBl6UuECIx/HYe?=
 =?us-ascii?Q?oWynDJT1ODj3yzmVWaH/Wn0Hz9Vuje07cM6FatMIMYy8If2yrQJDskw//wOF?=
 =?us-ascii?Q?AUBNiXwN3dmEVQTyxHz/s2juazEmxJBI2L0Zgd8wQpWklfik98xlY5oFlUqz?=
 =?us-ascii?Q?ZDvSg2rptwwaSJ2uKeBTvKbxciqVnbAXwZBn15OqP6FPjHPaFHvNnW2lLpWK?=
 =?us-ascii?Q?fghj5i6BUwuktaDNeRyYZuOqVpQI1lUDtJIg7jfysP+3wFVvZuvFGe0FMfDI?=
 =?us-ascii?Q?7rrIpqWvu3a9sUVmcRmRdTA=3D?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9236f0e0-a89d-45a3-eae2-08db91a5a654
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Jul 2023 09:08:05.1370
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Q09LiTBMxfqcOANyseIWFIhD2l7xdvjFBFyZni0evTdHM0H+XRszpWQSklc7stKcthGsrNal8RbAEq7/fC1OZ7cB5HC00lgZx3bNg7zbxxulDYsU34eg3OvvVVhHHkzY
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR04MB7681
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 31 Jul 2023 09:08:16 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/4086

Michael, Ross,

On 6/22/23 18:15, Quentin Schulz via lists.yoctoproject.org wrote:
> Hi Michael,
>=20
> On 5/26/23 11:18, Michael Opdenacker via lists.yoctoproject.org wrote:
>> Hi Ross,
>>
>> On 24.05.23 at 18:32, Ross Burton wrote:
>>> From: Ross Burton <ross.burton@arm.com>
>>>
>>> ---
>>> =C2=A0 documentation/dev-manual/licenses.rst | 7 +++++++
>>> =C2=A0 1 file changed, 7 insertions(+)
>>>
>>> diff --git a/documentation/dev-manual/licenses.rst=20
>>> b/documentation/dev-manual/licenses.rst
>>> index 9629dc53293..805b40fd482 100644
>>> --- a/documentation/dev-manual/licenses.rst
>>> +++ b/documentation/dev-manual/licenses.rst
>>> @@ -123,6 +123,13 @@ name and version (after variable expansion)::
>>> =C2=A0=C2=A0=C2=A0=C2=A0 LICENSE_FLAGS =3D "license_${PN}_${PV}"
>>> +It is possible to specify where to find more details for a specific=20
>>> license
>>> +using flags on the :term:`LICENSE_FLAGS_DETAILS` variable:
>>> +
>>> +=C2=A0 LICENSE_FLAGS_DETAILS[my-eula-license] =3D=20
>>> "https://example.com/eula"
>>> +
>>> +If set, this will be displayed to the user if the license hasn't=20
>>> been accepted.
>>> +
>>> =C2=A0 In order for a component restricted by a
>>> =C2=A0 :term:`LICENSE_FLAGS` definition to be enabled and included in a=
n=20
>>> image, it
>>> =C2=A0 needs to have a matching entry in the global
>>
>>
>> Thank you for starting this.
>> I'll get back to it when support for LICENSE_FLAGS_DETAILS is merged.
>>
>=20
> I believe it's merged now? c.f.=20
> https://git.openembedded.org/openembedded-core/commit/?id=3Dcb5cdcaf3310e=
889e80861ccfaf46c1bce624ac1
>=20
> Maybe we would also benefit from an entry in the variable glossary for=20
> this one?
>=20

Any feedback to give on this RFC patch now that it's merged?

Cheers,
Quentin


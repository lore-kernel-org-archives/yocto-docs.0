Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF033CA101F
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 13:16:21 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.67])
 by mx.groups.io with SMTP id smtpd.web10.17609.1757510172746071329
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Sep 2025 06:16:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=j5lP60W5;
 spf=pass (domain: cherry.de, ip: 52.101.83.67, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DXgh803dEWSNWce2WUyPpYinszw35vGpIhrBYy0iViCvVhDLF0rDy3YPgpz9yfE1tTJBExwoimeyKKyz8wMUiH262DiBlXcTfPaL61LBpNS/GBSrZyhUKlWH/lujD4xDyZ0muucURNRiZQeTrQpVruYgZT8NbDg9BGRAIEiCSQmtBrLgxjhtHJ79qrHSmEgRyXMJFRoJhkAIMJ2osIfzbsYO4p+fdnBypAvmpP9N8XPt6bKKy8MZpH4RnOSnG9AFJ8I5yKVutmZSamFNEv9FE0KKEwMKsILZALZuL2dcH26NyGgHlfhnA2e1+SkpOZIXm9aSUWRlv4jecX/T7K6WQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mNi0reJ71bvHxP04X9z0jeyNEN9NUG68ePnldJYfpJ4=;
 b=X6I2ZELZW4eMDSFF8itEeflWNimyqTx3quvMYUzRHC0Jn9qSKa9JqWyMz1uzxd5yiGDhnGmGGW4E2Ug0Qjuc5ewjx2YalfTkJyeueziIziWE7SAwOm5brUBEKLlYgFVfi5kj4ZeBkg6RfBWj6xGtjrocJNvYyAxCpxtg1a8VgwpEZF3Zf0I2SZAa7QpYmiGs+oPleFRbfLlG3CgNflx4fhzQrdCRZF0PcAq/caTVGk63t+BD8Fug+1xIG6TXX1qL6GHD1sGPhbaIN1xg3MjL13b17gLuC+6jG0DNeaC0B7mAe+MNmwjjVutN9NC3VcNoHeLDsn8f3yjqlTA5U/aA2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mNi0reJ71bvHxP04X9z0jeyNEN9NUG68ePnldJYfpJ4=;
 b=j5lP60W5P9ADrfRsA8v2nLnsXAP2fx3nAAbUoqv8UblXSqZpoEj4NIJ4v50ChE2NHNe/KBHnGWfec+a7HaI4GIbf4LivMqsHX/OEqoenNsDdcjy7rf542xBCRJupMVOAghJTLOuOIdN0Q9HyXoMvoXTmgzDkchp36J9Teorm0ao=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9140.eurprd04.prod.outlook.com (2603:10a6:102:22f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.16; Wed, 10 Sep
 2025 13:16:07 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 13:16:07 +0000
Message-ID: <bec3b912-1220-4478-a30e-4c4d828860b5@cherry.de>
Date: Wed, 10 Sep 2025 15:16:06 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] migration-guides/migration-5.3.rst: add note on
 systemd pni-names change
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Koen Kooi <koen.kooi@oss.qualcomm.com>, Ross Burton <Ross.Burton@arm.com>
References: <20250909-systemd-pni-names-v1-1-efb2fef7aaf8@bootlin.com>
 <890a75e3-89f3-4d74-b0f2-415f739ea227@cherry.de>
 <DCP56XVBU6BM.34FBDVS5XWORH@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DCP56XVBU6BM.34FBDVS5XWORH@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR2P281CA0167.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:99::15) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9140:EE_
X-MS-Office365-Filtering-Correlation-Id: 7c6e164e-8aac-490d-65e7-08ddf06c33a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UkU5M21Xb3NrMnYrS1ZqbFdzdjJYeTl3cVRZNUZtM1ROQXJFWWNOSEIzTFNM?=
 =?utf-8?B?YjNBRi9WTDVMSGQ3UHdXYjF0Y2RLVzlyRW9XcldpQitKdjV5dVdRVW0ycVdX?=
 =?utf-8?B?V3RDQUZVNjRiNDN1bng2Y2RvL1hRNWtDS3ZUVnM5NmxYeFpicnlRREpiemZS?=
 =?utf-8?B?NE8yYk5IcGJMQmxkZFRNMkpQT1ZIbDZBeFpMTTVDVW1WdWVwK1gyYUk0VmRM?=
 =?utf-8?B?V0VybCs2RHlyT1B0eHVOb29MQXB5RDhjVlFXeVNWbEhPR1BnR1FqbDZSbTN0?=
 =?utf-8?B?U2t4UTJwNjlPRXB4ZGFCRUt4c1BPcCtPd3JTaTVmN0h3bEx1dStyZE5OemtC?=
 =?utf-8?B?c2lmMjh1UGg1cHVVRmR6MURxMFBySWZiOTY5OFZ0eTlvemJqcWlya2NuQVNn?=
 =?utf-8?B?L2htZUJOZFpNM2RMVGpOTENGYlk0bEJuWjJqdkRpTGlOTm5LY3RCaGxwQS9n?=
 =?utf-8?B?cFc0bUg1QTF5ZG5oUmVQdExKM0dQUUc2QzNHeVNpb1Y1c1ZjYkZ4WjJPU01F?=
 =?utf-8?B?ckpFV2JDM1JvamJEakYyNWMrbVdnS0hscUFHalJaUzVUZFJELzlaSEwyblpW?=
 =?utf-8?B?QjJLQ2Y5S1RrVjJDd0pmRXhDcEhyRzdId1NtZ2JnL21EUitqZmE1bmFKOWMy?=
 =?utf-8?B?V05SQWZtZi9HYkc0WHlVdlp5MVByellIUXdBWFBHVk9DeFVGVXZCV080RTFs?=
 =?utf-8?B?Mnc5V2lIRmQwQjVVVDZoSDYzb3F3aHlQdkk5TUxobE1qQ3hTTmJyRm9XdEJL?=
 =?utf-8?B?cVpHOVEzWnVyVEQ1VW9nZFV5YUROelVSRVhuU3VxTVovbk1SdHBvdUZtTktY?=
 =?utf-8?B?LzNzK0FRS25YTVF3bjE0WkNnY3RJS1RIOTJFbURBUXc2bTh6RGsweXAzMm14?=
 =?utf-8?B?SWFxV3hXenN0VVVnVnRidDJXUnN0SkpNSy9JNUNHVGJ2RzNIV0ZFU3h4V01m?=
 =?utf-8?B?OXdpZThzak81eW5VVTQvbmVlQmFySVVKRWQrUlNzclg1R2xnMXNvSjFuSU5w?=
 =?utf-8?B?cHJGbXNHUVlJRHg4UkMvdFNVRE5ST0pUdGhKdmdJVlRNY2RkTEUzNHhZNnVZ?=
 =?utf-8?B?T0lodFJ4MmdtNmY4a3UxMjhud1Rrb2cyZ2xVTXNOMVNLck5vOGZoQU5CbnBZ?=
 =?utf-8?B?YVJ6cnFnRmUrMU1JZ2Z4WUduTTUyMkIwNjNaVjJPeVoyVDVZdFZKZVUwbjRk?=
 =?utf-8?B?enoya1IySE9MdWE3bzZiaWI4RTV3Z2hyakc3OWZSajhEODkveDBUUVdHK2pJ?=
 =?utf-8?B?Y0dxNzR5aUg1aEpQNUFqNmhmdUF0UkwyaHNXZVhaZ3VUd0FRL1V3US9leDha?=
 =?utf-8?B?VWp5c0FtM3VvM1ZVSzlwOHhmZ2dTc1hZdWVXbS9qNFJFVnRMWVpseTZDUGpE?=
 =?utf-8?B?L0FVeWUyNUtRK01TV09maG55VWJNWEtXdWRjWWROY2x1cnBJQVEvR3ZyeHVh?=
 =?utf-8?B?WmIyN3VMMS9JQkxWU2p0ZjFIVHRUQWtOV3ZuMVlOeS8wZnR2YUx4MVZlTUdW?=
 =?utf-8?B?cmJ3bC84UXRzd1VibW0xSndQbXNNTkdkanFlbENJcjUyWjhOelBMbC85WTFC?=
 =?utf-8?B?ZG4rRVNhMi8yMmpWSFBMeWs5NnplblRhMWpBT2FVSml5Uk1zMVdnWmxWNFlM?=
 =?utf-8?B?VlpBS1NjRXFIR2gyS1BmNkprVmQyTTFjSUc3QjJFUmtKTlI0UXpWRVhGQkVO?=
 =?utf-8?B?OTBpMTl1SXlDc2ZjK01mS21IV3U5QlZ4TkExYjJETTg3WExRRnYwWXRkT2Rk?=
 =?utf-8?B?NWJiTjRQNjhaelU0OHN5NS8zSkZZUHE3dWlPZjRUeld2SitLYllHOXM4OCtW?=
 =?utf-8?Q?UEm4iNC4DsKmljDvZ1aH8roVi0ckrCGbPiHMo=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?MXFIQUd6SXJ1Q1lsLzVWVlN1dXNRUkxyWlNpelU3a1hZMHNIRjd3Z3ZqVHZ6?=
 =?utf-8?B?TWNmM0ZaRUd4anU2a1hhWjRVeWp2WndHcnBySGNkaHN3dTZUTE1ZWUNpR0JB?=
 =?utf-8?B?aGFYckwyQ0N4MFpMZFYrY1BWMUw3a3NjYXZDUkYzRWIwWEdSckEwMFB6SEcy?=
 =?utf-8?B?SVRKSk5xRDc3WGlqMkVPNjYydW1DbkRmU0hKUExOSWp3YWVRT25Va3RSbHNE?=
 =?utf-8?B?c21rRHlrLzJKS29xWWtGN09IaXg1VEw4VnVJdlhjOXVVRWRnQmZmQmZtRGl3?=
 =?utf-8?B?aGwrc09wWXVJMEd6N3dWbnk2K2dXQU8weHVBQW04WmdKeHdmY0xodjBUUWpV?=
 =?utf-8?B?TnQ3bUxzaEd4Q3dWcklRaTF2alMrc1krWlBEMzREWndkZ3JYSzhhRVM0WS9i?=
 =?utf-8?B?dzZLTWdabzJRWFI4TGkyUTUvZ2gvUDZ6R0dFMkNZRmcxU0FocUpFK2ZBc0t0?=
 =?utf-8?B?eXpkbkdNeStEZkJ0d1gvSU5JUTFoKytOdmRSS3owVW1xSlVaaHRhQ0hTMVZP?=
 =?utf-8?B?ZmpYaTBiRjZhNlpBOTgxWEhCaklUNjlTaG8zdmJqOCt1OWhtOEVrOVVuek1O?=
 =?utf-8?B?Wnl6dURlVE5rSG9Yc2VDcGpNTkNHQ3pRSVkvNkM3b011S3NlWmMzODFwcU85?=
 =?utf-8?B?U0JKekZxeUp0T3AveUoxWWdkREh4T0RkWVAyZzd4RXQ3Y3BHZU9OSUhKeXBk?=
 =?utf-8?B?TURlamtKWmMwclJwTlFleC9EbGFkMkE1eGpQeTQrbUlJaVJaV25yTmN2NlEr?=
 =?utf-8?B?b1RrbUN5Zit4VjFDL25BMVhaZXZlWmZLeFBCeDBFdDhXbTZiVVo1S1kzMkR5?=
 =?utf-8?B?NnBuVXI2WW43RlVpemZNUTRrd0gweUhiTjI0M2Z0Q3NZUC9ueE5STXRoRjVE?=
 =?utf-8?B?aHdmVDJHaURQaUlGUXk5R3ZKMEtqWjRJZFNHTjBRdzZIL0kyeHdKTHZJVUIy?=
 =?utf-8?B?U0h0S1RPLytpLzhJRE5WUE1CWnB3clVVZHhDQStNeGJJcEJMWTBqWkkzSmxq?=
 =?utf-8?B?amIrdWpMYWptV0diT2lqQ0x4VEpVR0FtSVBnbEpqL004bGZIbnhod2xQQkZX?=
 =?utf-8?B?RVMwT1JzQk9Ga2RRUExCdmlKNlY5Nk9pbGtuZng3bmtlUVAydFN0RmFWWFQx?=
 =?utf-8?B?S2pTQmVxaVVxQ2lHY3pkSmNDY3lmQk1LTy9qdWU2TmRGcmdHZ0RRUHRTdjNT?=
 =?utf-8?B?cnNLRXhjOTAvRjV3VzBuT3hQRmxZYTBueUVSdUk3RjZTTEplaWpMVDVjVjRF?=
 =?utf-8?B?M3FRT3FIazRUNFhUVWJDV1NBUkM1TmN4ak5nRjVVUnd0K2lPOXdSSkYrbDlG?=
 =?utf-8?B?MUl0bnBQblNqUzNna0FaRm5vcFlINXdDVk01cFNnZXZRa0wyK1NVVGprRHE3?=
 =?utf-8?B?OU4zWmJLSEc4VkhaSzVJano4L2p1MEk1U0NVQmFJdWVqeWVOMCtYUFRjVTV3?=
 =?utf-8?B?Uy9YODFyMTFUdC8wTGhQbEpQZVdmUkRXaXBHeU1Qc2Q5d1I5NzBJOFIySUVu?=
 =?utf-8?B?bGdwZ0ZYUkJGUkJnTEFOa1VIdUF0QU5UczVoZk0wakxpTTlvL291WXlpbVUy?=
 =?utf-8?B?cXJhcnZacGFxUll3RE9MUUpTN1oyaEpEcGJ2c3UwNWMyRHRlYkhVdmtsRTZ6?=
 =?utf-8?B?aG9JenhLUS9NWFlBcU5HQ1E2WlNYMnozcTgrUk1ONWVwV3psb09NRE5rOU5x?=
 =?utf-8?B?aW16dzhya3h0c2UwYmVrWTJMa2hyZUJhbSt3WEVFTk1ITHFPdWZOR25TSTQy?=
 =?utf-8?B?cWErUk5VSFdJVWRVQlBwVDRXc0JDSWljb2NqY3dLaWJtc01GaWl2WFB5c2hn?=
 =?utf-8?B?anJTMm5JV1pDZ2R4Yi9PZlVZMmp3cFZnZkEyZHRDblNnZjZxZ3dqL3FUSHlS?=
 =?utf-8?B?SjdmS3hpN0owYlkzNURLdDBmWWl4KzRnRmhoMm16N3NjYjI3YURNdHFwNW0y?=
 =?utf-8?B?K2NOTXk3VVRGZ1IrZnljUVpyNHR2c2Ruc0pnMGZKTDdLOFFxL2ZoMXdDNWxu?=
 =?utf-8?B?ZXhFdkpId3NlL1JOVHN4Vkh0UHMwWlZjS3ErWTRDTHNZSVplZ1FKVGtzK05m?=
 =?utf-8?B?YVF6QytjL2ZTYitEWWh3YzRvb0w2ME5Sb3pPaGRJc0JpeTBVV1VhOVoySk9W?=
 =?utf-8?B?UmxXaTlHWVljMk5sMVl5QjBVUXR2T1QreC9PTERKNHUvV2k1RUNKeDVsdnBM?=
 =?utf-8?B?bkE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 7c6e164e-8aac-490d-65e7-08ddf06c33a3
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 13:16:07.2045
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6cdgP4TlRWhdJG3JEjyqEuW5hbIfmhl5YGNbRXrMp/TW4h4bA2TrZ/miBAnFVDCvtGORGjh13urFRQYjcQSEC9nn1H9vr6Oa22x/NxSBkos=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9140
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Sep 2025 13:16:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7494

Hi Antonin,

On 9/10/25 3:08 PM, Antonin Godard wrote:
> On Tue Sep 9, 2025 at 3:59 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Antonin,
>>
>> On 9/9/25 3:29 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>> Add a migration note on the pni-names default policy change after commit
>>> <> in OE-Core.
>>>
>>
>> General question, the systemd manpage specifies the policy as mac and
>> not MAC, should we follow that as well?
>>
>>> Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
>>> Cc: Ross Burton <Ross.Burton@arm.com>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>>    documentation/migration-guides/migration-5.3.rst | 25 ++++++++++++++++++++++++
>>>    1 file changed, 25 insertions(+)
>>>
>>> diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
>>> index 2d2f8d91a..8aa7b537f 100644
>>> --- a/documentation/migration-guides/migration-5.3.rst
>>> +++ b/documentation/migration-guides/migration-5.3.rst
>>> @@ -118,6 +118,31 @@ class. Instead, one should create a new recipe to build this FIT image, as
>>>    described in the :ref:`Removed Classes <migration-guides/migration-5.3:Removed
>>>    Classes>` section of the Migration notes for |yocto-ver| (|yocto-codename|).
>>>    
>>> +systemd Predictable Interface Names no longer MAC policy by default
>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>> +
>>> +The :oe_git:`systemd recipe </openembedded-core/tree/meta/recipes-core/systemd>`
>>> +used to forcibly set the MAC policy by default when the ``pni-names``
>>> +:term:`distro feature <DISTRO_FEATURES>` was enabled. See
>>
>> s/was/is/ ?
>>
>>> +https://www.freedesktop.org/software/systemd/man/latest/systemd.link.html#AlternativeNamesPolicy=.
>>> +
>>> +This is no longer the case. Instead, when the ``pni-names`` :term:`distro
>>
>> SHould we justify here why it is no longer the case?
>>
>>> +feature <DISTRO_FEATURES>` is enabled, the default policy from systemd is
>>> +selected (from https://github.com/systemd/systemd/blob/main/network/99-default.link).
>>> +
>>> +To set the MAC policy to systemd, add the following to a systemd ``.bbappend``
>>
>> s/to systemd/in systemd/ ?
>>
>>> +file in your custom layer::
>>> +
>>> +   do_install:append() {
>>> +          if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', d)}; then
>>> +                  if ! grep -q '^NamePolicy=.*mac' ${D}${nonarch_libdir}/systemd/network/99-default.link; then
>>> +                          sed -i '/^NamePolicy=/s/$/ mac/' ${D}${nonarch_libdir}/systemd/network/99-default.link
>>> +                  fi
>>> +                  if ! grep -q 'AlternativeNamesPolicy=.*mac' ${D}${nonarch_libdir}/systemd/network/99-default.link; then
>>> +                          sed -i '/AlternativeNamesPolicy=/s/$/ mac/' ${D}${nonarch_libdir}/systemd/network/99-default.link
>>> +                  fi
>>
>> My brain's sh parser says this is invalid because we're missing a
>> closing fi for the outermost if block.
> 
> Yes, my bad I must have removed it by mistake
> 
>> I'm also a bit worried about this code snippet as it'll just not be
>> tested or maintained once this gets merged.
> 
> This snippet belongs to a release note for 5.3 so it already matches the Yocto
> version? I will include the version of systemd version here at the time of
> writing to give some more context.
> 

Does this mean that we already know it's not going to be compatible with 
Wrynose?

People are told to follow each migration manual between their current 
and target Yocto releases, so this will essentially be understood as 
"apply for any release starting from 5.3".

We already saw how well maintained old example recipes were since we 
don't test them, I'm not sure it makes sense to have code snippets we'll 
likely never test as well?

Cheers,
Quentin


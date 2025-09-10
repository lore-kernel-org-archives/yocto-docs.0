Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F9D9CA0FED
	for <webhook@archiver.kernel.org>; Wed, 10 Sep 2025 14:08:52 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.55])
 by mx.groups.io with SMTP id smtpd.web11.18869.1757513329808960137
 for <docs@lists.yoctoproject.org>;
 Wed, 10 Sep 2025 07:08:50 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=go0N63uH;
 spf=pass (domain: cherry.de, ip: 52.101.65.55, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AzBDyO555SQaZK1LiTaJeBg/NYurhl4yRAhkDrD06/zYwlevDsJ2g5fpzEdkry+2VjMu+Wjl00RB98Bk1mWyiwFo4SwZGk+sH1jv/nedsyzsHED6y7UT5LIpGZCsmg6I78Yh+l1i4e6uLNuP/x2Q1audCMXdA9QgrpWjGhCS8dU+do6X6RLGFCfaw6lqOxMZSIPU2slo07gGCDXSPrzaQAlolxVUEPwdq0LioNqoptWmNlyyBEcvXtDla6YR9gBzO3/C3EuTUsmNHG4ScvLqWC9gi5oQWG3evVYPQz5Ugwdxn/dKH6Iek4EmVE966qdi93vaXZf7nsWDTWEsmHk9BA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sNIcsOkXb+1V+SRZtkrXnz3zn16qtN/1S+AU315qFxE=;
 b=ir79fNnxE9GzBOILNZ8m7HuoCZK7lFpfGQ0cMzYHK866feuu/ArO8AFZYd/BpixRHwPetACJWIZnuhcQrCkjGk8rhEDHWdSL0Kea0mgZzI1oLdFCyROfTvcqxe2Tfec9cwcsolapvrzuQfQAoCywPKAB9NknlnuTCdXL5v5pjWAGIZymkqZ4bS7XxMXZkcFS79AbKOJuf0QCMSSKGOvRmpmXTJLOUaGMldws/tFg36JydIz7Jjfcgh//qcV+MScAR8AF8wJTG1TPgK5vmtBp6clS2ZVQvcYHbWYS4fGCZW1sGO3uhWhdk3tq3Pvg2b76PMXOZTjawF9NKaLqSvcfiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sNIcsOkXb+1V+SRZtkrXnz3zn16qtN/1S+AU315qFxE=;
 b=go0N63uHw4lE2N5qh543xI4o95skKAbmlpTH7fW9bUkD1RTByjqrGEL21ZkfSFZUruk5/69V24+4KPZ+KByGieoRvyVa+byymDqrzXTmNrP3JmcEEB25qZ6HqzYSUZCZQlmvRD5sNMPwX6WWu/8APuHd9tgcfNvBS2IkDFXmd6w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by DBBPR04MB7689.eurprd04.prod.outlook.com (2603:10a6:10:206::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.16; Wed, 10 Sep
 2025 14:08:46 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.9115.010; Wed, 10 Sep 2025
 14:08:43 +0000
Message-ID: <f270625a-1bb3-4f42-b8ad-4ef13aced825@cherry.de>
Date: Wed, 10 Sep 2025 16:08:42 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] migration-guides/migration-5.3.rst: add note on
 systemd pni-names change
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Koen Kooi <koen.kooi@oss.qualcomm.com>, Ross Burton <Ross.Burton@arm.com>
References: <20250909-systemd-pni-names-v1-1-efb2fef7aaf8@bootlin.com>
 <890a75e3-89f3-4d74-b0f2-415f739ea227@cherry.de>
 <DCP56XVBU6BM.34FBDVS5XWORH@bootlin.com>
 <bec3b912-1220-4478-a30e-4c4d828860b5@cherry.de>
 <DCP5POSAGUMF.23UE4FM0ZY1DN@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DCP5POSAGUMF.23UE4FM0ZY1DN@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0201.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:ad::10) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|DBBPR04MB7689:EE_
X-MS-Office365-Filtering-Correlation-Id: 67afc3bc-3385-4ade-dcd1-08ddf0738cc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?MWNCVnkwTldPenVCSXhGL1ZwblBKemRQREthaW5CRGtUTGVmOEp6cXJuL01P?=
 =?utf-8?B?b1JEY1JYT1l3eWYvcCtQRkwzdTRiRktiMEhOM3NxUG1IN0YxUEpmUHdXNXUy?=
 =?utf-8?B?K1dweXpGelA5K2srT1M5eWV0MUlRbWJtTmZEci9kVUdobkhieTFUUUhnSC9u?=
 =?utf-8?B?TEwzQ3RjNnFOTXh2VlBRRXhRK3R1WlVrbjZGZ0NIUWVUcTJYOS9PZXQ5bkdD?=
 =?utf-8?B?NEpkZFB1Z3lsUVN1b2R5ZHVuRGpoeEQwTzZkampEMEQ5cUM3YWkxQU85L09B?=
 =?utf-8?B?WE1EQVlyQkFuY1dvcTRIZnlKU1crOWtOMWNXOEJidDYwZmFOMm9ib1dZek5E?=
 =?utf-8?B?UzJJTURTVVJnNE1mTFhLMlNwTis4QVF3S2VFdzQvWGJHQnpHNEx6eTBzbExJ?=
 =?utf-8?B?c01CNzEyTUdVaWJwNTRlL0ZsNEUrR2E1eGNzOWphWDdjY1VJTTRtMmQyYWVS?=
 =?utf-8?B?VUZEdHphNWo5aHVJSFFtZnRrUTVPS1JCTGRTZFBkbGwzRUowU0R5MWR1MzVD?=
 =?utf-8?B?YTEwSzgwbGlwZnYwYzB4MFVBZWxKcjZESEN0V1RiWHQ4RkgwQTk3aUFRNXRk?=
 =?utf-8?B?QVBWQlM4QUVsZG5JVkt3bDM1OXlod0llVVBQWDhJS080QmJ1VDFIbFdXY2g1?=
 =?utf-8?B?NE1RY1BUbFY2ZE9QbE9JdHRqNzF5YlhkcUhLamMvRmxxaU43N2ltWkhGL1BD?=
 =?utf-8?B?WG0rOWl6enZoaVhlZm9JdGpBUE93ZkpwUVZYOXhsL2hnanlDOWsxSkFjb3RI?=
 =?utf-8?B?K2RiU3g4RFhFSFRCR2NydTBWYWY5S1pSblNad1RwT0QyNFJyWUg0QW9kd2xX?=
 =?utf-8?B?aitPelRMYVRObWtCdVBMSnA5UHhSZFhrSGpJbVFGMHY4NThOeERiM05zZ2Fh?=
 =?utf-8?B?bTl5aEI3RUhkR0xxZWJ2cUI5TCt2VVNFMnJqNFJ4U0tMd0hPOTRhWHFuTk1o?=
 =?utf-8?B?OVFqaDF6dEcyeVpPbEp3akxqZmtyUjhVU29qVDVvRm8rdEYwYkY4RlFBNklp?=
 =?utf-8?B?OGlwQzNJb1RsL2kzNm1BSmRlU2NFN2lBVzEzdExLZGNicmlHOUhKY09sYmVY?=
 =?utf-8?B?dzU4d3NxaWM1VDUrVnJBbmF4c1dYM1k0dE41TUZyOUlOakVwTnNuSXN4amdu?=
 =?utf-8?B?cFQwUUI0NUVuR1cyZXFzRCtDaVM4VXZVSStyaS9US2RaUC9XUHg1eUE3dXQ1?=
 =?utf-8?B?SlpqcHFBYkRVcGhIV0JUYkRPdVZqcUFhcHJLODhMc01WWnM5ZU9mK2tlaERS?=
 =?utf-8?B?OG1XZm96ZVk2eE1JckNBOWRWWUprN0FOUzFZTGUrK1pTK0RLemlWUUJIQmgx?=
 =?utf-8?B?STM0QlRiekUyY1BDbHFUQVBhWDA2Z0pZeU1XVSt0azI2SWZVYjh6dkZpL3Bv?=
 =?utf-8?B?RzFyR3Fwd1NjV1NqNDFqNk1OY20wNWJkZFhGTVZwZEd3N1VJUHZZR2l4cklS?=
 =?utf-8?B?OWZTQnNVRzFRR0lkTGIrTW04T2xlNWM5d3NabWdxSFhubWpuVnV1TGV1eFNQ?=
 =?utf-8?B?K1dYOWt3Vkh2ZHFZTHNaT3BJc0Vua2djcVZ6cHpFY2lhZVgyQnZGZW8xV0Jx?=
 =?utf-8?B?bjlTZUxUMUFNMnF6S3p4VmZENVM3cS9nVkpBYTJqRHpydVBIY1BibWtLMVY5?=
 =?utf-8?B?M2pXdUVZbUtjdHZLQ2J3bU1OTEhZRVc3dnZRREwrU0k1V3VJWU1WU1E1VTJR?=
 =?utf-8?B?ZGpTVTNSMExqV1ljK2F3VWR4S3M1K3dia1NpSjVkSlllNE1mZk5YVUJOSW1r?=
 =?utf-8?B?RmFkbnJNSnh1aDgrNEgxaTVnNEJJRjJCc1E1cEh3VnFBdXdPWkRJTGhmeDMx?=
 =?utf-8?Q?UKZ0KYKX4yVKzTb2QLZJXJRbfqPV+5ep4STQ0=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?M21nYnF3ZkRTbThWT3Y5M2pGRXRDa05BaGc5OEZWZmQ0UlBlM1laOE9ydGc2?=
 =?utf-8?B?NXRPSy9LZ2tTRDVXUll0VUN2bnlKSWc2NkNRUWJiRHdlZDYzUENTRURvM3JT?=
 =?utf-8?B?ckZtc2hBNU1lOVFzbmZVMWNaQjZKVTVmcmZoc3RxdkZFa3Y2NVZTM3N4dmgx?=
 =?utf-8?B?Z0FldWZ5bkEyTmdkY09nbE1yZ29ScGowdWowQ2dtZlJycm1ycCtwblFBNHFK?=
 =?utf-8?B?eWFYNWd3eklLMVZvYithYmR4MHczMVNGV3VtaGYzUEhiZFY2SkpHVUozN256?=
 =?utf-8?B?bFArbTlsZU5hVHNXdlpRYUUxYW92UVE1Ny9HaitTdVh0cStKejhXRTBmek5C?=
 =?utf-8?B?d1VZeVErbmU5UGd5aGRrTzUzNHoxRlVZc29aZWlGekE1TFZxam9mYWxtWDNK?=
 =?utf-8?B?OXZvTm12WXd2NWRIUTVleVJIMVJSbWtkbkpzN2czTnNTTjJSUHBwRytpczdS?=
 =?utf-8?B?ZEtsdlgzUGNEVlZyVkNISFByWDljMG5WSytETEhhRFI5bER5cU4wTVdZRjFh?=
 =?utf-8?B?c2c5NHpTR0tMOWRtOEtpYldheTZ2eUdybXphYVNFM0c3TUowSmpqQUFzOHhT?=
 =?utf-8?B?by8vMFhLdTFjOUE0c3BiSWg0eVdFM2UzQTQzcmp4Z0o0ZXhLNk12djVOOTgv?=
 =?utf-8?B?aXJFR0dhaDhYZmllcG5XYjNwWElCOGZ6STJzbEgyR3greFBKbEdhai9oRlk5?=
 =?utf-8?B?SWlOdzN6K0xaOG4rdXEwaFlLV1JqaHdEMWpseUVvUitlR3J2eE1DbWVJWit4?=
 =?utf-8?B?aFpEeThsK1MzMHJvVkhoM3dpb1NkaC92T0pZNm5DU2d3d0RtQnJrRGtZNWlp?=
 =?utf-8?B?TldYeGYzdVRUR2hzbFl4QVY5RVBpcUlONlg1RlZjUmo2VXJ2czVmLzRGT05r?=
 =?utf-8?B?RndoR3htWXNPOStnWU95NjAzdzZjMHVrQVYvSUVEUm9OajNPSThIL09GRUpM?=
 =?utf-8?B?am51NHI0cFlqcWFQdWpOQnM0QjdLSzhSOEhXWTcwQWo3c254dUlEU2k4MFUy?=
 =?utf-8?B?S0hHbXk0NllRdXJFTy9Fb3hoNjJDV3Q1UlFlWDFuUnlQdTUrblpzYVd6VXpX?=
 =?utf-8?B?VUhhbTNCOFZlSWRISjhKYkRVKzU4c0l5aEtpK1FKR1hYenpuL0hjUEN5WnRn?=
 =?utf-8?B?QU1MaFlwTFlQMTN4NUFJZHhGdTVHTG9UR25BTnA0d0ozWmRGWVdUeHM5cXF1?=
 =?utf-8?B?Y1NzM0dFSG1KeGdEMjJzaUdxdS9iNlBKV01BNHc2Y2dSZE1FZDRka3VSZGk1?=
 =?utf-8?B?T2Rka3RwQWdsWTBXSk92a2RnMERuUlptRzlwbS9wNTB4OEltcWpzVTg0Y3hS?=
 =?utf-8?B?Q0cwK3RqdHJ6NEFxbzZ6UTUwejZ5UFpzVjlWUTNxT2xnZ21zbmVFM3gvUCtW?=
 =?utf-8?B?N2JEQ08xRU13Uy8rYUFxUC9vSEVzeEErMmhRS2Q5VUdJaERtckVQMHBoYkU0?=
 =?utf-8?B?OEpVekVVYzFoT0lVOFlRNjErcTY1ZEFmcitOcWhVcU1GVlVSd3FRSWNWVVFP?=
 =?utf-8?B?N0NDcUM1ZG1SZUFaUmZYY2Q5Nkx0OE00VVVCWm9tZzJTa243RGpkU2RVZStS?=
 =?utf-8?B?bEhFOVpxRzVwK2x0UWJQZ0dqZjNNNzJ3cmxWRmFTSlhxYSt1WEY2MjU4WVNI?=
 =?utf-8?B?d2RiQSthY3ZNWUhZQURvZUlIUG1DakZsbWY3aUkzSXRLdGJDVXJEaFlweXYr?=
 =?utf-8?B?OTZnZVVZYkM2T0pXcFcrMHRSN1NXZFJOTGVqaXZVWjBqbkQxaUdJV0Y0dUxB?=
 =?utf-8?B?SFFnTWZqL0NFU1lUNTBtYnR4RUdCeUJXdmFIalA2WjlwTDBSYjg3RGRna0U5?=
 =?utf-8?B?YytUYVZvTkdZbEpSUWVYRHZ0dE1RUFpCR3JsNXlkTm5NMDNsdElOZExDajlO?=
 =?utf-8?B?SGx3MkFmaWxoaXduVnUvMUlDUWoxQkdnTHJtK0ZBS1d0c2wzcG9WUVRUdGUr?=
 =?utf-8?B?Ylo4N09XNkV0VU9uZy9qVW1uMkROZkdaRUl4RFBNSW4vVXE5UjhVdGJvdCs5?=
 =?utf-8?B?WkJqM1NNTGc5a2V0dUlsSW5rZFdmU3N5bmw0S2w1cXhoeWVIV1hHYTZRSTl3?=
 =?utf-8?B?UE94bGllQ1NGMWFOSW1ZbkhFSHdvMDZkZGt3U0haWDlHd1BwbVNVQmtqbFZq?=
 =?utf-8?B?MWNydG40emdnQXJQb0hUcUZPNWZZak1FVkt0anFCK3dyL3Q4a2lLaTdtaDEr?=
 =?utf-8?B?K1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 67afc3bc-3385-4ade-dcd1-08ddf0738cc4
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2025 14:08:43.1480
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/c89RyHcwVZSRMNMRdErANg24Vn3szt0tT/MHv3ydqHuVWFtUl2nUO0PQt8lu8mgaxKGeghcw14b+zj3uPrXiP+stBnLjPQrj+gPcb8s4M=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBBPR04MB7689
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 10 Sep 2025 14:08:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7496

Hi Antonin,

On 9/10/25 3:32 PM, Antonin Godard via lists.yoctoproject.org wrote:
> On Wed Sep 10, 2025 at 3:16 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
>> Hi Antonin,
>>
>> On 9/10/25 3:08 PM, Antonin Godard wrote:
>>> On Tue Sep 9, 2025 at 3:59 PM CEST, Quentin Schulz via lists.yoctoproject.org wrote:
>>>> Hi Antonin,
>>>>
>>>> On 9/9/25 3:29 PM, Antonin Godard via lists.yoctoproject.org wrote:
>>>>> Add a migration note on the pni-names default policy change after commit
>>>>> <> in OE-Core.
>>>>>
>>>>
>>>> General question, the systemd manpage specifies the policy as mac and
>>>> not MAC, should we follow that as well?
>>>>
>>>>> Cc: Koen Kooi <koen.kooi@oss.qualcomm.com>
>>>>> Cc: Ross Burton <Ross.Burton@arm.com>
>>>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>>>> ---
>>>>>     documentation/migration-guides/migration-5.3.rst | 25 ++++++++++++++++++++++++
>>>>>     1 file changed, 25 insertions(+)
>>>>>
>>>>> diff --git a/documentation/migration-guides/migration-5.3.rst b/documentation/migration-guides/migration-5.3.rst
>>>>> index 2d2f8d91a..8aa7b537f 100644
>>>>> --- a/documentation/migration-guides/migration-5.3.rst
>>>>> +++ b/documentation/migration-guides/migration-5.3.rst
>>>>> @@ -118,6 +118,31 @@ class. Instead, one should create a new recipe to build this FIT image, as
>>>>>     described in the :ref:`Removed Classes <migration-guides/migration-5.3:Removed
>>>>>     Classes>` section of the Migration notes for |yocto-ver| (|yocto-codename|).
>>>>>     
>>>>> +systemd Predictable Interface Names no longer MAC policy by default
>>>>> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>>> +
>>>>> +The :oe_git:`systemd recipe </openembedded-core/tree/meta/recipes-core/systemd>`
>>>>> +used to forcibly set the MAC policy by default when the ``pni-names``
>>>>> +:term:`distro feature <DISTRO_FEATURES>` was enabled. See
>>>>
>>>> s/was/is/ ?
>>>>
>>>>> +https://www.freedesktop.org/software/systemd/man/latest/systemd.link.html#AlternativeNamesPolicy=.
>>>>> +
>>>>> +This is no longer the case. Instead, when the ``pni-names`` :term:`distro
>>>>
>>>> SHould we justify here why it is no longer the case?
>>>>
>>>>> +feature <DISTRO_FEATURES>` is enabled, the default policy from systemd is
>>>>> +selected (from https://github.com/systemd/systemd/blob/main/network/99-default.link).
>>>>> +
>>>>> +To set the MAC policy to systemd, add the following to a systemd ``.bbappend``
>>>>
>>>> s/to systemd/in systemd/ ?
>>>>
>>>>> +file in your custom layer::
>>>>> +
>>>>> +   do_install:append() {
>>>>> +          if ${@bb.utils.contains('PACKAGECONFIG', 'pni-names', 'true', 'false', d)}; then
>>>>> +                  if ! grep -q '^NamePolicy=.*mac' ${D}${nonarch_libdir}/systemd/network/99-default.link; then
>>>>> +                          sed -i '/^NamePolicy=/s/$/ mac/' ${D}${nonarch_libdir}/systemd/network/99-default.link
>>>>> +                  fi
>>>>> +                  if ! grep -q 'AlternativeNamesPolicy=.*mac' ${D}${nonarch_libdir}/systemd/network/99-default.link; then
>>>>> +                          sed -i '/AlternativeNamesPolicy=/s/$/ mac/' ${D}${nonarch_libdir}/systemd/network/99-default.link
>>>>> +                  fi
>>>>
>>>> My brain's sh parser says this is invalid because we're missing a
>>>> closing fi for the outermost if block.
>>>
>>> Yes, my bad I must have removed it by mistake
>>>
>>>> I'm also a bit worried about this code snippet as it'll just not be
>>>> tested or maintained once this gets merged.
>>>
>>> This snippet belongs to a release note for 5.3 so it already matches the Yocto
>>> version? I will include the version of systemd version here at the time of
>>> writing to give some more context.
>>>
>>
>> Does this mean that we already know it's not going to be compatible with
>> Wrynose?
>>
>> People are told to follow each migration manual between their current
>> and target Yocto releases, so this will essentially be understood as
>> "apply for any release starting from 5.3".
>>
>> We already saw how well maintained old example recipes were since we
>> don't test them, I'm not sure it makes sense to have code snippets we'll
>> likely never test as well?
> 
> A simpler approach could be to say:
> 
> """
> To set the mac policy to systemd, modify the ``99-default-link.link`` file
> provided by systemd in a ``.bbappend`` file to set the ``NamePolicy=`` and
> ``AlternativeNamesPolicy=`` settings to "mac".
> """
> 
> This should not require maintenance. Do you agree?
> 

There are many ways to set the NamePolicy key for a net device in 
systemd, c.f. https://man.archlinux.org/man/systemd.link.5

One can override 99-default.link from /usr/lib with one from /etc or 
/run. One can add 98-whatever.link anywhere with a [Match] section that 
would match the device in question and 99-default.link wouldn't be used 
then. One could add a 99-default.link.d/mac-policy.conf file to set the 
properties differently. And probably other ways I missed from the 
documentation.

NOT modifying 99-default.link probably would be a good idea too, because 
then you don't need to recompile systemd just for changing the policy 
for a link and can do that from another recipe (possibly even an image 
recipe modifying the rootfs on the fly depending on a distro variable 
for example).

The link filename could change also, in which case those instructions 
will be outdated too without our knowledge, but that should be easier 
for the user to figure out.

We can also mention/link to the commit in which this changed because it 
provides the diff with the (back-then-)default that got replaced and 
information on how to do that from the commit log as well.

We could simply say that when pni-names is unset, NamePolicy and 
AlternativeNamesPolicy are unset. Otherwise, the systemd upstream 
default is used.

Maybe add a link to the manpage as well, via :manpage:`systemd.link(5)` 
(not tested)?

No better suggestion though :/

Cheers,
Quentin


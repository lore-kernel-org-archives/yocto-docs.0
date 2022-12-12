Return-Path: <quentin.schulz@theobroma-systems.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 952EBC4332F
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 10:22:59 +0000 (UTC)
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (EUR04-VI1-obe.outbound.protection.outlook.com [40.107.8.42])
 by mx.groups.io with SMTP id smtpd.web10.39702.1670840572006021721
 for <docs@lists.yoctoproject.org>;
 Mon, 12 Dec 2022 02:22:53 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@theobroma-systems.com header.s=selector1 header.b=CX2nLQ/+;
 spf=pass (domain: theobroma-systems.com, ip: 40.107.8.42, mailfrom: quentin.schulz@theobroma-systems.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jhfTgfy5UwDlvGA7RDO0KQX4ubBZqDi8Vftt4nJkNrpwOOZC6YlZQgMqcMql4i+u/kKgl9lPePcKQTBnrc/sW/+3HAuLznrReI7r1g7I8K3eemL0UkL87JSbNagrbaAnZAmVPcHmU6SrHcDvbXUZpFn2tB1OBRt+uSWy6VGhBfsThV3qHNUlUV5Nxg1XEKP6mhi5SJNqjCR36JNJs3xZRSJ++LU8/e5phRicmHq3stLPy05lJAhktsted5vXUQKhiZFlIXk7TG8oPv9YcTGt7pG7lc/htK5CpULqr7dY5bXadKDUlodYyTz4Dw910cRQ67ULbfHm5GCjLjPHcbMXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hyvOLs2xIm7UGmx8llrtqavL0g4UUlhj4BagR2JriT4=;
 b=PiS0ZXEFt8SA+f9ZNqXsde/vwLxllV6QpvvyyKR1ShygQbd+pTNZrA/zr+X0OH6iVmyxdwwsh2T0KBgeieOLCsDIn5rulM0RWU9XJnWQ1nFKJ/OtroUwb1Orr9ESVuy6T4q2uuXVru1NvLjNBhmuFIuqXLyhDhPGTbhXFW/B/vdex3VgvejgHBXkfNHJZC9r6J42zVvhhtUhLVQ80BhIadcNHEAy/nPan4njO5X4oRWr+uVVdCkn/C39lukxsyOS2vTifOQsIQRcAuJvArIGbbSdMV9FM96J6sjF4cv6eMKF07efreJCGBvW/VwknEzFySsHFtXCv3fjvA1sSxOkFQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=theobroma-systems.com; dmarc=pass action=none
 header.from=theobroma-systems.com; dkim=pass header.d=theobroma-systems.com;
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=theobroma-systems.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hyvOLs2xIm7UGmx8llrtqavL0g4UUlhj4BagR2JriT4=;
 b=CX2nLQ/+q+Oa8TJTZyrk+ZaZyqadC0lNhLz9qTZCeATDPLxQRkBnBXfm2q4Y0R7KWZbppqyoHQKdHLiXkI5PTzptT0wuYnVsOgyRgM7/ijM1sHQwz3sfOAsovFXHILnMc9VZTx3iFQyzN5sDBA9he9Ra5yrAnliHAClcXseH4FQvzn0gRkNC/XPRAoUS5QVzEwcNfNDy448SjiVtN17HbMl0vhktuRORT97A4pVCn7O4Sh6i73gA9YD4UgA/jHoAFRf6IgsQ1LHHiJTSbIVvCedUYvxO9TWPUW0PY7y41siMMjwFaEj4bjnkYlhCFa/BYplr9mKrFs/+tkIhFN3MYQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=theobroma-systems.com;
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com (2603:10a6:10:2d7::10)
 by DBAPR04MB7350.eurprd04.prod.outlook.com (2603:10a6:10:1a9::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.8; Mon, 12 Dec
 2022 10:22:48 +0000
Received: from DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6]) by DU2PR04MB8536.eurprd04.prod.outlook.com
 ([fe80::9ebd:cd48:9396:76f6%7]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 10:22:48 +0000
Message-ID: <14b23bc2-f744-4452-64ac-ba1926324b7d@theobroma-systems.com>
Date: Mon, 12 Dec 2022 11:22:44 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.5.1
Subject: Re: [docs] [PATCH] manuals: final removal of SERIAL_CONSOLE variable
Content-Language: en-US
To: michael.opdenacker@bootlin.com, docs@lists.yoctoproject.org
References: <20221212094955.58455-1-michael.opdenacker@bootlin.com>
From: Quentin Schulz <quentin.schulz@theobroma-systems.com>
In-Reply-To: <20221212094955.58455-1-michael.opdenacker@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VI1PR08CA0087.eurprd08.prod.outlook.com
 (2603:10a6:800:d3::13) To DU2PR04MB8536.eurprd04.prod.outlook.com
 (2603:10a6:10:2d7::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU2PR04MB8536:EE_|DBAPR04MB7350:EE_
X-MS-Office365-Filtering-Correlation-Id: ba55f125-cdb6-48b3-ca6f-08dadc2acfea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	0MUZT08PoxBO4jRbapyy8jxzcEBzezbSR82bLyYuSc1d9YRFmrT0pa6uAX1j2vJ09FMqAIc+0HXbFKfJ2pyibISXS9eNrvceGl5BXb5i+10Ds4t7gs/3rau5izqnaUvDksjSV58CPd1weogc7cg8i0L14WApXUVWyZYcMvE2mdDl+M1rUhdyhKfOJlH8E/r/AwqHgtws4xec92uSNmfa5UDuNfATr2XYJVItp2TVMeNZtoOXXJ/+7/5BT0YNvexirTkkaK7xl9IxWLd/o9hF8vDVHEM7ESULUIGQob3MDxxTmRCJBOhLDyYnQjSMTON4lkoF0qdQs4/nz9U/ASXVxifnJHNNJZiTZvRuDyfWLegnr4E1gNZfvpPY08tNabDH4Egxvpq4HH66fHzzsYr5p+5yZKBiABobIJ1XIxUTqahK43bS045V46Z8fJ6lhZqqiKEfd5IwWtCG0ew6KJpVzgIpEcVbVOhLi62KkB7/L7RDAbNng5Bid/jjqGR5URLr+ZNVxYVTtpeFnP4OhSGu1grpvMkW/yA4+2WNtMsXiC9f/mjOmR2pVOyK9r0ahOtNRgmbXgtSaGzonco1jz6uXxyFYFM3hrMuGYPottetaPoa6EY7+g32NeuLDcsI4wQr9vpVGUfEbtXVYJ7oS4S+hM4y572JYULSaiJj+TfLF+qoMOmXSRfKOjGg+ghyg7A1HV611kayxG3yEeywSgYkKmdc1pctg5jxqAwq8k9O0+3Fjm80TnfvuP7/nQ8wT+WA
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU2PR04MB8536.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(4636009)(366004)(376002)(39840400004)(136003)(346002)(396003)(451199015)(38100700002)(8936002)(31696002)(86362001)(6486002)(966005)(478600001)(6666004)(66476007)(8676002)(66946007)(66556008)(41300700001)(186003)(53546011)(2906002)(316002)(6506007)(83380400001)(6512007)(44832011)(5660300002)(4744005)(31686004)(2616005)(36756003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?ZlErdzRDWjEySDhKc0Fvb3ZjcVFUdy9GeUR5Wis5M0RHQTNEYjlnNVpwVUk3?=
 =?utf-8?B?UUowQlJBRHZMbmVHZ0lnUStwMGVVV2hLZzAwZGtrV2Ewa2VyZHg4blhHUy9j?=
 =?utf-8?B?SkRDbDFsUnhqOHJDblVFc1VvL2MzeWs1cURFZWx3MW9oTXIwVDdHNzRCaCt2?=
 =?utf-8?B?dXhQbUUwa1kxcVZsQWI4bHI1OTM2REJGS296VnRFUGt0c3hIaDh4MFMzbENR?=
 =?utf-8?B?K0FqUmdXV3ArMGwxai9ENUpReTBDZWkxQzdvcjliaWdWZmJWY1dpeTB2a2FR?=
 =?utf-8?B?MVRNdk9wKzExSGVmK3pEUm9jUG15R0VrOGxWYTJXSFcxT05UTmtkMXJrNzU1?=
 =?utf-8?B?b1RvUVVTZ1Jrb3RBcTB0SVdwQXlCM0VZcEE1WnFzeWl3T1RGb1F3aEpublZT?=
 =?utf-8?B?THNWYkpNa2RwQ2J3ZVFiYnV4dXJWUEZhdGVmalk1Umt1b3hyR0xBcjc2ZjFU?=
 =?utf-8?B?ZW8rWmdFTmRrTVlqdU54c0VTWGQwVW5VM1lUZzd0dWU1T0lLLzRta2p3STVJ?=
 =?utf-8?B?dHVCL2dlMmhhQlorV2hrM1gvdWE2YVkyOHZWMi9BTytyVVlxRldtckVCL1hB?=
 =?utf-8?B?OGd4YUNJWk56WlRWbHowWWZFUHY3R0NTQ1hSdWdxcXRtV1hXTUhjaTQzU015?=
 =?utf-8?B?RmFMS1VXR0ExUDJsOWE2NTNaRGpOWlRkYjI4N2htOUsxbkliWE1Rc1AzYVQ4?=
 =?utf-8?B?am5tQ3A2ZFNaZ3EyTHpzblowdXRFanFuTGR6UlNHT2dub2tTNkErdjJMcTZv?=
 =?utf-8?B?dzJaV1dYWU9YMG9RTmRGcWtCU04rUVo0alRzY3BmT2o1V2RISUpUYkE4TVhj?=
 =?utf-8?B?YkdSRTJ2SUh5cEcwbGNPekZtN3owMlg2elpyUE1Cek91YUpKQzNBUmFZUnhM?=
 =?utf-8?B?T1d4ODN4SXBRb0RnM25xaGZkYUNKZXFwcDZHbENBck1FTTF1UEdzUTlSbG5C?=
 =?utf-8?B?cjVtb0FrQVZlbmxPWjVrbzJNWVBtWU9YMVZsQkRuU1A2M2tEcnlxMDJOQUVz?=
 =?utf-8?B?eklIbmJGT0M0QmJpdFI3Q3NhUDZqRTkydFpISFdZbWx5ODNuR2tqTjdkZTRy?=
 =?utf-8?B?SXlYc3ltVlBvM1o5R1hVMGJZRUhsSkNtNkZYWG5HbTJrUnhJa2oxbU1tMEZM?=
 =?utf-8?B?citZNnJlUWhack0xbENrSGRpR2JIa1B5K3F3RWRSbUM0b09kK3RsdHV5RkFk?=
 =?utf-8?B?ZTRmcXp2aFhVK2hDOTVWeVhaR2NmeEJSM1VaZU43K3MwSTg1MUVhcDN6SkN4?=
 =?utf-8?B?cENEQ3A1MkwzcXRXWUJHZ1VmdlhEak1ibnVJL2NPbjRRODFPUVBMcTdFOTV2?=
 =?utf-8?B?WU5yMEt6WGx1NDdHUENqREVHRFBFM1IvUkZtcTN2S3RIRzNraVc1SnA4bk9n?=
 =?utf-8?B?RXMxOGc4amtGYUJxajBXcXRmRE9Kc0Z5dEloR3lJN1BFTTlPdXc2TnNodEhY?=
 =?utf-8?B?dFRrOE5kTVhjWXFRa3ZvZXNKbnRpMVFOS2U4cFBDODl6S09mQ2NseUJIWnpn?=
 =?utf-8?B?eFk5aWhVbHVkcDRZM2s3ZlY1eG9QTW02Z2hrclhxa21VNzhiNW9kRm9DMDVX?=
 =?utf-8?B?TFREWW5aYXFqN3NuMmk3ZU9sbjJsNUFkOW9ndG5sS2dTbGF5WU9COStLU08w?=
 =?utf-8?B?SjZ1Mm9La2lhNHlJaDBiZHBuY2Q2SjRUNGZJYS9MWENJdlZueVZvcXVhRno5?=
 =?utf-8?B?a2ZkbisyMEFqTGE1S0hMbXBzRDBYOVErbjJDMU1TN3RVRi9FNTRqK21NT1hn?=
 =?utf-8?B?amg5akVLc2ZvOWhRV0k0V1FJK1RLczdQN1J0K0VKdVhncGRGeDNBUzJDUUJp?=
 =?utf-8?B?WDlwZ1MyYTU0eDJ5QlRtMHgwYTRaLzZ5OEVWb0xxNmMyak5vZFJJaUNaSlJ6?=
 =?utf-8?B?ak0vL1JaY2dUY3RmZ2ozSytiNjlQbGVhMTA2OGdMYnZUMWhzTEJhdjZ4ZnNa?=
 =?utf-8?B?R25md2ZsYUFyMnBMY3FWbEg1T1U2VzdPUDRGYWxKai9UQ3p4Y2djWnRQNWFL?=
 =?utf-8?B?eUhwalNtR2hZTXljR0hBQmlOcnNjTWl0K0FlSmtZOUwvK2ZKNlRrREN1QzB4?=
 =?utf-8?B?bTk4YlMwSWhjeURKdlFGMnRWVE1uQjNvS09zYVdjTGFJSWpkUWR2K0lESTht?=
 =?utf-8?B?aXFOT1NtaVRXOU13VXh5Nnc5OXZOYzh4MDdKazJrM25ST05MbHlrazUyWmdW?=
 =?utf-8?B?WmZLem02VnhLc3Q3b2tUQmJuYTMrT0Y5LzFIS0o1VHdOdlY3ZTJMUEVBQmNP?=
 =?utf-8?B?QTlPV01uTzlWTEhLd0J3L3JMMWZ3PT0=?=
X-OriginatorOrg: theobroma-systems.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ba55f125-cdb6-48b3-ca6f-08dadc2acfea
X-MS-Exchange-CrossTenant-AuthSource: DU2PR04MB8536.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 10:22:48.0832
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s38qco/67l7nhMiCK7JRXq1j0SOJya8aC0Qpb2K7D5lNn1wTCtvp2SvGqicoDTVls9dfLCVhyc/7q6270kbGiZ63GX7vjXgZKlaME6XysKJqKDWFRizJyTeaxMVsPX5r
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DBAPR04MB7350
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 12 Dec 2022 10:22:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/3546

Hi Michael,

On 12/12/22 10:49, Michael Opdenacker via lists.yoctoproject.org wrote:
> From: Michael Opdenacker <michael.opdenacker@bootlin.com>
> 
> This deprecated variable has been removed for good through
> https://urldefense.com/v3/__https://git.openembedded.org/openembedded-core/commit/?id=9d053af1fb570b4e3483de4ecd6827e1e0be61b7__;!!OOPJP91ZZw!mdIhsk9314XecKGpMxgc_65hSaYE2VoOo41x1ne13KiL-CTEfSgyidbnwYhCshdThpFx9pkMiUToxlsznioCpyDfYgQ641L54bUJg6MTpZwevFvYDYzv$
> 

Should we start a migration manual for 4.2 that we update every now and 
then rather than a big change to review right before (or sometimes after 
:/) the release has been made?

I don't know exactly what's the workflow/process here, just asking.

Cheers,
Quentin


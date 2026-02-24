Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B268E9B26A
	for <webhook@archiver.kernel.org>; Tue, 24 Feb 2026 14:05:20 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.20])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.20974.1771941910581558020
 for <docs@lists.yoctoproject.org>;
 Tue, 24 Feb 2026 06:05:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=Iw7etER+;
 spf=pass (domain: cherry.de, ip: 40.107.159.20, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eRicNHNEQ6BBdMNjXbmU8dcDK1RQiJ/mL0LTtVhqiCnfxNPago88EnJIxJjnm3ktCjCQM2LPnXRiyBFIafMmeojGpuG5ti2IHZtbEl8fzvlJx7Mv635cUezupckPpU6yTk3b3ht5i7vIfWEL8z27qVull1zm7GcgBI5Fha4w0D9ayQIJ/bZuc9qhRo3TXJVNezYcUJdwO1UNU28/nSRn9BP2dj6DGlo8jDpMn9wQ99CPRtx+aDhF9AiIyDt3IzsAhhwCgnz86V53FFkxSyJOTMi1ckwyeiyK4S6ygdwwbrZ3MXwM4qXVpnWWh+RdJZ8etRs5QV/Aymbs5Q+fBL8DJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PzI4pkHvKuH3/g2wEqwV3NgkNnV9APl32h4izJoxaTc=;
 b=if4sm1PXvhhnQH8SlAnKgm+VT6Su2fgCbemzM368oZa80Lv5JNRFmCArzGBIBxiJbJos5cF4gZyyBZA4OA3pabAVNbCit64J38NItvDH5LASZCW8n4xQolFjd/NMT2k0aR/S5ePKGpT5Cdi7wY/1N7f0/XZ7sdZWafH1ayPgsXi/v5s6S3uV+sxr0bleY7qqtWQj1l4DzQ2KxAXGzXQBNBm3wUaiGpMDkmtqjEBAljnUkdHqYPMCz5CidbeQbdyxu+CBzsVqWbs0Ypck8xzuKGy68uE2ogLG72jFzWDKU0v9VFw1znUC7zgJuDSEu61qNd/GRabi90kdf/+3yT1Aqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PzI4pkHvKuH3/g2wEqwV3NgkNnV9APl32h4izJoxaTc=;
 b=Iw7etER+BgffhnBvBZqvsbnanu0HvTmOp0DgsugkHY3nIIOEfPPbGjHiHmGcjcTQlYrGtknSjd+xBsyPCQCB9uJyNxYPL+hrELlsapE2o5Y1vSQXU7T1KjFhdmyakbpITtIQVJhlxoyMtAaT+iVzFrQGBK3OINJpaJUt1Sv0aRw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by DB9PR04MB11536.eurprd04.prod.outlook.com (2603:10a6:10:5e1::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.22; Tue, 24 Feb
 2026 14:05:06 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9632.017; Tue, 24 Feb 2026
 14:05:06 +0000
Message-ID: <f336c43c-c7e7-4f6d-88e0-c5cc79f26b77@cherry.de>
Date: Tue, 24 Feb 2026 15:05:04 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] variables.rst: expand explanation of RSUGGESTS
To: rpjday@crashcourse.ca, antonin.godard@bootlin.com
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <1ee12fbd-a5c7-7b14-a558-cd6dda9e539e@crashcourse.ca>
 <DGN78E65FUWN.2BTR1KCHXV2VN@bootlin.com>
 <1b69d976-4159-354d-a283-bd06bedef3b7@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <1b69d976-4159-354d-a283-bd06bedef3b7@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0232.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:e9::13) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|DB9PR04MB11536:EE_
X-MS-Office365-Filtering-Correlation-Id: 9a56436f-40ff-4947-79d8-08de73adb679
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|10070799003|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?RFllQ2s2Wno2RlJ6VGdMaU9jY0xuQjJOeDRJTDcvN245U2JmMmxzYm1Jc3By?=
 =?utf-8?B?Y29kcUxHcUNqOHlMeEZGWk9BUzVndUpYeFVGamcxUHV0MG9mTlNRdDBEZWFG?=
 =?utf-8?B?YkpGRDVuSHp1NjE1ZXdhZVdWWFBhWnNabGZqR0JtcnhxN0xRaHRiZTlpTURv?=
 =?utf-8?B?Z2sxV1h0Q2pUc2E1MHZmSHhtQWNjS3ZKREhhajljWll2VlE1c2YrRXB2dzd0?=
 =?utf-8?B?YnZZaTR0RHVWMG5zb3J1SGtoNnRYSG1uNjR0ZXNZaUp1a0lRY0ppRG05eWpH?=
 =?utf-8?B?eVU4Yk5nNE5pUjdnK2pzbThqWW1KRVNHNWFINmtpVGRubnlXTFJDRW5kTzVv?=
 =?utf-8?B?NDFLRmF6bGJFelR2ckVtZnRjMGo5QVlnVm5xYXlMMFd6aDFqNkJsdlhLSVFI?=
 =?utf-8?B?TmVUem5ScVZ5Nk5IdzVGQUN0QkpGK3Z4Wm9LNjhMdmFoa3hIUHQ1MHRvMG90?=
 =?utf-8?B?Q3RlOG1yL2tHT01ITGpBRU9qVVZpemd6VHgzdFBRU3BKT0xEVVg1cVFncGQy?=
 =?utf-8?B?Y05mZnZDVm81RCtHWGFJQzdvR1cydDN6b0JYdXg0YjhDRFhGTGUrb0xJQ1d3?=
 =?utf-8?B?VEdVUTdEcGJPN01Tc1NvUk8vN0VvRktrbXNOVVk1VUYyT0pZMjB5djhocG9H?=
 =?utf-8?B?bStHZmcxQUNNd0lsRytMdXRLMHJQZEFLcTVIVXIvekpKV1BwZEU0TG5xYURS?=
 =?utf-8?B?ZU5tNm9xaThpb3RLK3B6bVZjcTRiZWNnT0NRaWVxb0QwRmN3eU1jUWhKMWxH?=
 =?utf-8?B?UGZpZ3YxcUVXSmJuMnlNbkRzby9wN1FObGp3UG5HZjA1QjNnVmp2akRLNWRk?=
 =?utf-8?B?M1UvVHVUbmozVElMREFETDJ5WkFEN0Zjek5uMFNJSkc5QWtHSVRWcCtCb2ZI?=
 =?utf-8?B?VU1KZzk3ZGFMMmozTG5UcjZIMGpMaUxKaHpjWjl1NFRiWHI1MU51MXJKcTBl?=
 =?utf-8?B?TFNoZVIzQXBWZW1sbXVFb21uQnQweFhSOGRMM21UcGU1alMwWDZoUVdFc0tF?=
 =?utf-8?B?M1Bwc2RmMld2VjIyeXBVN29RdGYzUG0wb0ozOUF6Z1FqdkxEUkVFR2VKeDhI?=
 =?utf-8?B?QUFiYXZ6NkRsLy83TGVzbTlINm9ldVgvNVc3SVZmT09rZmJkaU5sNnVnZFNX?=
 =?utf-8?B?bGZGUmZDd2oyQjVwTnloYnU5VFVJSVVPOUZlNkpuWEJuU0sxZVhGcW10bUlo?=
 =?utf-8?B?Q0cyY04vempsMklNRmozVjR5cmtoc0ppbUpoTlBxQ0xrQWd0ZUJ6emVUWGlM?=
 =?utf-8?B?L0xzWXpTdjM0cUNxcGh0M2t1dUhDeW5IUk5LNWFhcVk1dVhONGM1bHR6Z0xl?=
 =?utf-8?B?bVM0MHlra0VWNHpSaml6Nm83S0ZRKzR4bysvekpadUE5T3VlZ2FtSTVwYWVP?=
 =?utf-8?B?RVdBVUhaaHlyWHVQRFI4Qm5WOVFvTDRmckRqVVh4ZVdkN2hJcXh6dnB0Q1l6?=
 =?utf-8?B?WW5aRUFqREJ5UUltUHhOMHVZaUN1OXZHb0drbnJUYUNYZmJVUW1xUW1OLzJs?=
 =?utf-8?B?bmQyYzY2MHRWTEw5dXEyd2JOUlEvNnJhWmhPL3lVYmg4d2cwVGYralloVDVF?=
 =?utf-8?B?M0xsbTVzSmxHMkZzcDlqUTRIV3c0UENnOFpxVk8zM1FIMS9kcWRGaVBUTk9u?=
 =?utf-8?B?dS9Fbm5KR1k5blc0Z1NMRmVKblFPVGRPbHZyUWhPcWZlZ2xEUVpXN2duVmQ5?=
 =?utf-8?B?RTdvQXpZRHdKbEF3cGZzWDhEc0lwMlZpQjFXTklUMDlNa1hBeXlQVHhlSTlC?=
 =?utf-8?B?UTF4cFhmN1Z6Q2hzS1QwRWNlMVM4YktETXJ0aXJIcXljWDV2ZGVuU1R6cHd1?=
 =?utf-8?B?YkQwY0d3RU96YUlYeHpmM25XRXJJeVl6dkxSWmx2SWJOZTZyTVBPelRldEQ5?=
 =?utf-8?B?TnFVZGJkaHdHL09sdDFZaHRFVjJ5TWRGWktlMjB4TWtzTFlPVlZVRFpBOWZM?=
 =?utf-8?B?WVRyQnZNQ3VhK3lZMzZWVXJCNUxWS1dsWlpaUFVreU1tNTMrVExTOTJRMlJs?=
 =?utf-8?B?OFhnd2pjZjVMMWxGWVQzR1YvSDAyUXM4ZndLS1dnWGZyclU3V1BGa0w5NmFW?=
 =?utf-8?Q?YWAo8l?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(10070799003)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?aUhpT0Fpb2ZoUTRVVEhYVXZpeHl3ZmM1RnphODY1d1c3MzdwMjlRUm9MM3Fh?=
 =?utf-8?B?c0dMOGtoQWhWRlA4NlVlU1g1OUtRWElsbjZsc0h5eVowd1RBcmd2dlltK1JX?=
 =?utf-8?B?Skt3WGJTOHNDdnQyYkNER0oyWG5MaEY5WnFWS3JyRFZ4MUhidGMzbWRxRWZh?=
 =?utf-8?B?K3N0RDJYOVpYZEhCS3NZWnlxK3pXdlpEN0U4RWZKS3VHTTFLaFd5VGwrWVhk?=
 =?utf-8?B?WU02cVJGbUF2T3c0UmxjdVRMdTkxNFJvRjJSU2ErSTZGdGN2b3Y0KzF2Q3Mv?=
 =?utf-8?B?SHFRQkxJWmwwUEpaQmNvb2g1K25DRWJPS2ZmN3Z2ZFllZ2wyUVpZMHFEbnpJ?=
 =?utf-8?B?bGlSZWR6bE02dC9Ta0FVRlVidkNIODlhR214V3VCT2djcmFneTBvMGNSTDRH?=
 =?utf-8?B?VVFYbmNrbml3ZElYTXdmZDlRb2o2VEZIOVVBajJxZzA2dThFUk5hWWFTNkpN?=
 =?utf-8?B?WGUxMHV2QnRKSTZodGlTcnBmdUc3eFF5c1VLWmNFSFNHaFhOUENFaXZNOXli?=
 =?utf-8?B?UWh6K3greU9xQ1hydS95NnJwM0VPWitSak1oVlBMK2ZsTnRMMGVqaHJjamw3?=
 =?utf-8?B?NGJWUTNjdDljemNiOWI2MFlzOVFDUjNlaU9yMVkyS3NaMWlESzRGcHdpaERF?=
 =?utf-8?B?NWhPOHNNbHJUWmhzMUxpanZkVDZMczF6RUpFcTFRd3gxUExpRmYraFJOMTJk?=
 =?utf-8?B?YVZVYXN1YVYrTDFaY2JEQmFMYm82a1lYT0lSemZhenBKd0lNN2MxbVhwc0Q2?=
 =?utf-8?B?VG1GUE1xUXREOWRCQUgybmY4Z2FLMnZJYWdzdzRmRndBa2kyVi9jRjAvSERJ?=
 =?utf-8?B?MW1wR3RtK1NCNzlWLzFkTjhuMTNxWi9ReENjdFJPTHpXMjJ6bnBjVkNJWWZS?=
 =?utf-8?B?SVUzeS94RW9kaXJaNEpwdkdTckdCMkdjK0FqL0FUdENUOXJ2MHkrbU5xK25o?=
 =?utf-8?B?RStCTGNHUlhoaTJNZ3Naa0ZWamJWMXJjQXBXQW5hRXFiZlRMWHQ4UFdlWXFM?=
 =?utf-8?B?bTlZbWtEWE16ak9aQkd6ZmY3VUp2V052dGgvS2hKTzdYOVZXczNRVmJhUGww?=
 =?utf-8?B?eEhQS3VUR2hscU82cmtJaFZNcWJLaGF1WVRmVFQ0cjJaQ2podk1uL2pKQXV4?=
 =?utf-8?B?REtsQmp2R2c2Mk5NeUtxOGlDcWxOY204NmVQc2Q4Nm1aRENpZ3FoUHl6R05j?=
 =?utf-8?B?QjdIZGErYXAxcmprVzc5Z2taRkxpdm5QMGJRUWFQbDAxM2RPa1pSUEMvQnJn?=
 =?utf-8?B?dzlpQW0xS3czZVB3dnVFcnc4OWkwR2Y1bDEvdU43ZlUrQVg5UGl0cEFyT0cv?=
 =?utf-8?B?TGJLcnpGRGxXYnZobENhMUQ3MXg2UVZqWXkxS0E5OVNqM2YrSmxNcmU5Y2Zo?=
 =?utf-8?B?OHNvWCtpSm1SalhyWTE2K3FvTlFqdE9pUDVaY25kRG1tRXNRbWtxUmxmUE5D?=
 =?utf-8?B?QVhZR2tnbll4SVJiaEk0NjNSM1ZId2dqWktreFg1Z2o1NHBVWVVVZGczbEZK?=
 =?utf-8?B?OGE3WGViMXZNNVFwYm1MemZ5a3dMSGxjZG96TFpaQjlOTGVCNW95d0Jrb29Y?=
 =?utf-8?B?NC9ZOENYQ0NvcGNCcGpRd0J0a0JNaUJtalVHb3lUY3A0QWh2b1g1ajRia3hy?=
 =?utf-8?B?OVFHc2RHa0xuajRGbGpVQ3RpdHYvQ1pQaEZVSm1yeWRYLzRINkhMYmJIR3Bz?=
 =?utf-8?B?N0F0dnNmbSthSGxqZnlMaDFuZXo0L2hoRk93YTBHTTZhN081VnUrNFlqaW9I?=
 =?utf-8?B?Tm5sdDdIZjZaa0R3ZEZMTXZIRWkwcUo5SEJkdFZIeDAvNVhtSE9qMkpXclVn?=
 =?utf-8?B?RElPY3JhYVg1TGI2OVJqUXM1aGxYTWRiTWV1RE5WcGJHOHFhdUhwSkt4c3hz?=
 =?utf-8?B?Vmd0QnJUUFBhb1N1NFF0OTYzN0xhdllVNGlvSlRhdHcrQVNIT2VINnpEd3R2?=
 =?utf-8?B?WmF2Zm0rNVVxU2l4Wk1OSlBSVnI4SGxwNTh6Rys2NnlBVEF2cGZXR1A5Y2dW?=
 =?utf-8?B?eHFKd1ZGVkRSL0FTckI2c1FsSXh3SlpVOEtFSnRKSFB4SGhKTnkzcWVTQkVD?=
 =?utf-8?B?aWhsQ2xjNEFtUjVISm96R1ArVlk4TzIrYjg5RzNsNUljYkMxREJHYmVxeFpm?=
 =?utf-8?B?NXA1YURSMzFIL2tzMGdzUnZKZ2FyNm1PRlpOZlN4YkFXbTlvZjBRa2QveU5v?=
 =?utf-8?B?MS9MN3pnaDFRQ0lqTmRKMEdrR0I0Z0ZNT2srZXhSYS9aOU1EZDNERUJWaG8z?=
 =?utf-8?B?eEFLMUtGaGp2YzN6by8vOUhYS3NnRjZ6T1pLRXlBREVaVVg5SnA4d2pDTlM0?=
 =?utf-8?B?ZkU0MEk0dVduNFFQM2U2UlhROG1RVlpqM0hicWljMUVZMXRjT0ZjYXAwTnZl?=
 =?utf-8?Q?w+rWt3Zcl+qnU9azvDyByMlDtUuhS3IaFl8+T?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 9a56436f-40ff-4947-79d8-08de73adb679
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Feb 2026 14:05:06.2224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PyPut4ii0P7WvCvGHmL2G9K+cxvMTM+9jYaf/J6kRE8s8buxcxMpP4C3BNpH4nJgoJITn5rSWMUdnjrQL80bWt7/lgRn6NSs85FvML8iQgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB11536
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 24 Feb 2026 14:05:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8972

Hi Robert,

On 2/24/26 1:55 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> On Tue, 24 Feb 2026, Antonin Godard via lists.yoctoproject.org wrote:
> 
>> Hi,
>>
>> On Tue Feb 24, 2026 at 1:15 PM CET, Robert P. J. Day wrote:
>>>
>>> Add that the RSUGGESTS variable would be processed only by a
>>> supporting package manager when installing packages from a
>>> package feed.
>>>
>>> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
>>>
>>> ---
>>>
>>> diff --git a/documentation/ref-manual/variables.rst
>>> b/documentation/ref-manual/variables.rst
>>> index 208b5e43d..92476d509 100644
>>> --- a/documentation/ref-manual/variables.rst
>>> +++ b/documentation/ref-manual/variables.rst
>>> @@ -8361,7 +8361,9 @@ system and gives an overview of their function and contents.
>>>      :term:`RSUGGESTS`
>>>         A list of additional packages that you can suggest for installation
>>>         by the package manager at the time a package is installed. Not all
>>> -      package managers support this functionality.
>>> +      package managers support this functionality. This feature takes effect
>>> +      only when the package manager is being used to install packages on
>>> +      the target system from a package feed.
>>
>> Could you add a link to the section explaining how to enable this?
>>
>> """
>> See the :ref:`dev-manual/packages:Using Runtime Package Management` section of
>> the Yocto Project Development Tasks Manual for more information on the
>> package management feature.
>> """
> 
>    oh, man, did this just open up a can of worms. if you check that
> section:
> 
> https://docs.yoctoproject.org/dev-manual/packages.html#using-runtime-package-management
> 
> it has no reference to RSUGGESTS, so sending readers there might be
> less than useful. so should some explanation of RSUGGESTS be added
> there to provide context?
> 
>    and when i scroll to the top of that chapter:
> 
> https://docs.yoctoproject.org/dev-manual/packages.html#
> 
> the first section, "Excluding Package from an Image", mentions
> PACKAGE_EXCLUDE, but does not mention using IMAGE_INSTALL:remove,

IMAGE_INSTALL:remove is *almost* always wrong.

This only has an impact if the package is explicitly listed in 
IMAGE_INSTALL variable. If that is the case, then instead of using 
:remove, simply do not add it to IMAGE_INSTALL in the first place. If 
it's not in IMAGE_INSTALL, using :remove will be a no-op.

If the package is brought in as a dependency, you need to remove 
whatever package you explicitly list in IMAGE_INSTALL that is bringing 
this package as a dependency, which may not be possible without 
rebuilding the recipe with different PACKAGECONFIG for example.

If it's brought in as a light dependency (read RRECOMMENDS), then 
BAD_RECOMMENDATIONS or NO_RECOMMENDATIONS should do the trick.

PACKAGE_EXCLUDE will prevent building and then you can easily figure out 
which packages that are to be installed in your image depend on the 
package you want to exclude from your image. This is a good starting 
point to start debugging.

> which is definitely used in places i've run across. should that also
> be mentioned as a way to exclude packages?
> 

Hard no from me. See above why I think it is a bad idea to tell people 
to do that. Maybe we should actually explain why this is a bad idea as I 
see this being repeated here and there.

Cheers,
Quentin


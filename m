Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB003C5B552
	for <webhook@archiver.kernel.org>; Tue, 10 Jun 2025 13:21:56 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.65.35])
 by mx.groups.io with SMTP id smtpd.web10.86712.1749561711327902210
 for <docs@lists.yoctoproject.org>;
 Tue, 10 Jun 2025 06:21:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=D23eYyY9;
 spf=pass (domain: cherry.de, ip: 52.101.65.35, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RDIJnnyJFbdrjO34cC1j52AUjt8mx/mJnS7GVWiTaFEGQmmqHsHeN2klX+gnRmBRf8Z5NdRZALgdvPUqKJabeTsdLwiwg8x8PwmHyxAEjKUUaNqNgEtfeLsa2E7fJGOtSEGRSXTyvcsGzEt6QAd/GjIu5Q14S3GhGTAaWpoE4wFq5V5hklkAbAISZN5P/Jq1MpNRZW7lG49pjl8wzpkArcgXJmJefpTWzmoin+dm0K4vOmhuIaOjsy8Tb1H21B64x/xWWzrwdqQL6VpWg2Uwvuzhom5Ct5wlJJjB8lEJbcyhLFdKhb8Sl2JUgRPQLYfdPGcm1tajk04+jMlJauynig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+PgluliKeYl6pR+dV2+702fahcQUReiAI9RmvbG0ij4=;
 b=PMqIHLVwWlf5TRf/CkBoYlh+rhl33oFBYZ3cqsKBtwU/zoXDu0Pyqay0KifDwaUX2BFoaQVlwHw8v7srmmkrtallLcf99kVHZt4JNV5U0EVoym+yp1KpXY0Eom330j/2OpXdxIixSd51I5YtUnRwbOwjq5mxnqbVOVNNTnnSwZEzHcrR17NgzTVcFmZzMT7jtSfSLS8czZd0Ty/IK4iwkU14NGSVd+fqyEJ5h2UC/UoJqmfrMBMw5jnzOwGjOZwnBlLIj33uHKXiVby7lpRGHnANGrYb0Xj/LzK5quGRsvfufj4d2K3WkP7BstXWrXGkkBbfB4S7QexhkpNVlp9g7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+PgluliKeYl6pR+dV2+702fahcQUReiAI9RmvbG0ij4=;
 b=D23eYyY9dhBkM99c1P5Vq6xmJn8Vf1P99nBVO/hwljGnFV+GiN2pFfm2n9D929vC2zD6DR+Mq1I1QDUuzjXrnqQ0KcVNmZlKkWaS5RTpss7SlQ3qNBekEszvO62BrpGPigwqu82YGghf7yN2Ixc7Metc9ePv0wmyA1fr9dv59E8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VE1PR04MB7358.eurprd04.prod.outlook.com (2603:10a6:800:1a5::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.29; Tue, 10 Jun
 2025 13:21:44 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%5]) with mapi id 15.20.8835.018; Tue, 10 Jun 2025
 13:21:44 +0000
Message-ID: <50df3e5f-7f15-4bf4-8ea5-d639ecf2fc72@cherry.de>
Date: Tue, 10 Jun 2025 15:21:43 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] Add a document to list supported Yocto features
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
 Richard Purdie <richard.purdie@linuxfoundation.org>,
 Yocto TSC <tsc@lists.yoctoproject.org>
References: <20250606-supported-architectures-v1-1-5eae2c4a2257@bootlin.com>
 <0cd19563-a1dc-48ed-9924-63a75c5e72f2@cherry.de>
 <DAITNWBR6NXN.2LBDVZFSIHX02@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DAITNWBR6NXN.2LBDVZFSIHX02@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: AS4P195CA0045.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:65a::18) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VE1PR04MB7358:EE_
X-MS-Office365-Filtering-Correlation-Id: cfdc6b4c-425b-418c-6089-08dda821bed7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Vi85byt3ZFZiUUFMYXRIdnhCKzMyM2xUcnpnb2tkVFpaSERiblJYMy9qUXJI?=
 =?utf-8?B?YnhOdzVnQ1NkSFVDaDNINjFhdGZrRjdJRTlxay9mT0pkbEQxdUQ1aGErS0M3?=
 =?utf-8?B?ZGlkNTJyUExodnJtZ0NsN2c2Q0VTeVdScnVVZUxaRVcxOUcxM3FiRUJrQU1v?=
 =?utf-8?B?Y0ZXVzJsT095Wjhra1Y2NnRlMHUzR1Z6V3R6dzBMOC9RZnp1QS9ta2ZuRnEx?=
 =?utf-8?B?UkxleWNWWWhJYTBoTmRPYWZrSWk0QUN3QjY0amlWcktYcE1kYnhZQVVSQzlB?=
 =?utf-8?B?WFFDdk42N3ZqMnU4Tm1qMGhyRlZTK0QrVFNsejVGWXpmTFZHWVR2Z2tFVjVL?=
 =?utf-8?B?T01nVXFRS1BsYTJYczVlVVJVdzBnYWhLbFExVnhUVm5XeWdPOUNzZHRoNmhq?=
 =?utf-8?B?UFkrcTROL3VZWSs5SU4yUW1ScHY1bHZsM1ZMTFR3V1dPVDc4Y0ZLQVR2Y0JS?=
 =?utf-8?B?QXdkbTUxWjhXVDFUcWdmYnh1R09mUW42ekRCaElMeE9kS3p4aGRKUDlJTnl4?=
 =?utf-8?B?Nk9FeVBZRk1ENkJESUNDbjRlQnNhL0htczV1elU1OVF3KzRYRWtkSDg4eHBo?=
 =?utf-8?B?UVhUTWVsUjQ1bG1uM3NTUlBLUEZBd3V0WDRvc053N0QrRHZ1WmVyY2pRejZR?=
 =?utf-8?B?OGU4ZENkTyttUlkvYU5xdmVab0ZCVXcvVEFyNWh4elhUNFlKb1BzSEU0NDNH?=
 =?utf-8?B?SXVtU2daNk8ydzJyejJnQXpCY0F2VGhrR1Q4bFZhWHBZYzRJQ3czcVZhMVc2?=
 =?utf-8?B?NExaV2hhQWU2M3FIVWZHVzNjVU5ubm9qK29rZXJOMVgreUtYM3NGMkdaZ3gy?=
 =?utf-8?B?K0J3aXE3RHVMVWJxWE9Mc3Z3UGVwb2hJRUhNcGw5OGFkK1pUeTZ5RFBMUFh1?=
 =?utf-8?B?eGZPSHNBaHNxRE90eisvWFVtbWwrOUYvRlgxLzJsSURreGwzYitwVHZXb04z?=
 =?utf-8?B?cVI2WWxQVDVOMzdBbC9yR2VjWU9CbVJqYlA3WDRMOXlQano4Yk9ET09IeUh0?=
 =?utf-8?B?bjRvdlFiY1pKK3BSTytWcXZjb2dEaDJ6dUxCaW1YUGxldWFwRFd3SjZSeXVP?=
 =?utf-8?B?cnlFbE9wcjdPUGc0dVN6aUlqNElFTGZTeS93VXZJcGVLUGVvNHAzRGxvN1Rs?=
 =?utf-8?B?cERPSm5NZGc5VlFyVmYvVFBtanl4aWRPdVlLbkUzejRLUWU0azU4cGQwblRX?=
 =?utf-8?B?NW04WnR6MjR4UEd1MTN1c09jZStFbUNZVkdCTnRXaGhHTUFWVjFaK2lTSHVj?=
 =?utf-8?B?K1FrMWVhV2R2Unpwd0pGZEdSR3dMNVNqZUdjbHdPekNJM3ZFQVBpM1U0TUp5?=
 =?utf-8?B?dU9xWnlaSXorYStwajlNalFzQTd0eUVLMFZPNjd4TjJUSUg4dTlWMXdsZ0V5?=
 =?utf-8?B?RUNQOHlxN0hrY1RlOVp5QmwvWnovZVJQeXRjOGxsUVZEdnArOU1OamM2TCtK?=
 =?utf-8?B?RC9mVFl2NDNWKzg4c2xXSzlkU0w2bGZoYzBsRlBWaWYyL0tSQ3hqVmRSQ0Zn?=
 =?utf-8?B?QTNwcXd3ekJIcjZSSWlHZVlrblViZ2s3dHI3dCtTeElWQkhaRGRKM1NiRTJr?=
 =?utf-8?B?Y0JONVRMeHNKeElsWEh0NEcrdlFjTHV4Wmx6bmc5MFYreGFNd05Fb3ZZY09Z?=
 =?utf-8?B?cnlWcm43eEpFZXo0LzRPS28rTEt0N21MdjFoYlhNVlE1UUhtQXIxRTh5RmxV?=
 =?utf-8?B?VHVHN3o1TTZ1WWhaWUFGakhLS2F3c1gza3N6N0xESGlHSEoxZWl6NXVEbkpU?=
 =?utf-8?B?aVVTeVYwVXA1TWwzcjNsUEdyVFREUTFMdW1mUEoxVVY2em1PVTJ0SVJPNUZ6?=
 =?utf-8?B?TFozLzlTUHZvMm53MUdYdkVCek13RGgwNC9DMU9SVkxDMTczRTR4ZE5SU3Nu?=
 =?utf-8?B?cjF2a3FGUzFLN2RlaVMvUEVnZ1hsTkJWS1JEMmZhZFZLZmViaGhOYXVKdkhz?=
 =?utf-8?Q?sbpWgknnx/E=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UUMwelVrRFNYNDluaFQ2NEVKVUFVQzY1V1cwb3I1Mmg1clJmVjN4UHhzN1dl?=
 =?utf-8?B?QkMrN2lLWU1RZE55MFVjbkVhZG9ibm1CSWx3S3JSUWJqRkxWb3ZwS0lzSHll?=
 =?utf-8?B?WmVIQm4wQmE3OHJpTWZBSHUvZFdrNzAvMm9FdzBEbUduZGN1NUcxT2I0WVRW?=
 =?utf-8?B?U0xhNUtPb2dFSklZdkxsOVV2eUZBQ2tLZXczUHJZV0YzdC9PSHVpNStsOXV6?=
 =?utf-8?B?cEJWZEVGbzFGclhOTmMxZHdsUHFyZzY2N1N3VFE0WkJENWx3MkZNdXRvcmVO?=
 =?utf-8?B?UmwyalJnZFM4aW80N2dKd0VuaEExMzRhOXI4Z0Mxb0FLeXA1Q0s4d01IWmpK?=
 =?utf-8?B?RXRIa0YwS3diTk95c2MzMG02K2pHUExEUHdITkFISzJCeEJUcXYvYm9iSnpO?=
 =?utf-8?B?SUJ2VU1ia2s2RzJFSS80Qk5WdVZJSlhweTI3ZlVkK2h1dktlc3JtSTVwNGlS?=
 =?utf-8?B?SEdFM3diNnRXOG9RNUlKdkJXaWtqRFVRbTZBTHRhSHkwZFBtMmRDVmV1OE04?=
 =?utf-8?B?Y0t6K2VSV3ZtUmp3UFkyZ3JQOEJoQW16Qkd4MVZTZXlIeWRIS01pVGJDeXA3?=
 =?utf-8?B?cWdHdWpJblg5U3VGcmU5TWFqWnZQSjlzb21SSHlab3o2NUhIOEV3TXVxVkk5?=
 =?utf-8?B?V2tiRmhDZ3Q5RmFaVk9LalpLR3BWVmRyQnczdHo5akFGRXNRaU5EYnk3OG53?=
 =?utf-8?B?TEczWTlJeUR0cnRPYU96NWp1VExnOVF1bDVZNVdQUEU0dFdieWQ2QlRxSEVh?=
 =?utf-8?B?a2JhRTFENURhZGRScEowd2c3c3g1S1VnV082Ujl5VytOMCtWcTVWdkZMczlm?=
 =?utf-8?B?MW1aeEZHUDhEbkJmUHFXQXRKSURZVFRpZkJyNjNNYkpBSGxlTDY3dmZjNjMz?=
 =?utf-8?B?Y1BVdk9PdmtKT3BsU0FxbHhGVDVGV3RmYjYwK24wVWRsTW1NM1JvWXlVSFRX?=
 =?utf-8?B?YWZ5MTNuRm1Hb3h1ZzBoekNwdXJoVDA0UWdOTFNqcUVFQ2gwSE1WbVh6UDFs?=
 =?utf-8?B?UDRkMFhLaE90cHBwZU1RdWxwUW9SRlRaTUpBdktUQllLaFZmZkMveU9BWklK?=
 =?utf-8?B?NnBlSW1hWFR3UnhXdDgrNkh2UGJRVUhzVXRNOWVoeGRacHhYUEFSWE1CdEpn?=
 =?utf-8?B?Rzc5VktjOGJ3bEw4Y3IwUHVJQW5Vbk5NWU01c2xaRXNlTERkMGZwR3M0WGQ0?=
 =?utf-8?B?RFJJOVdtL0w3OEtURm43Z250VHZZT0g1eGNOcyt0Sy93UFlpK3RiNWswWXhy?=
 =?utf-8?B?Wk96R3lQVHFadXhlbDhEY1J2Z3UyYldpbnAzR2pid1JibHQyLy9HdldYcmxI?=
 =?utf-8?B?V3N1UEtycEZrRms3cjhCdHhiN1NUYXVQRmlvSGxEUVFrZXEzYXlBTXhod280?=
 =?utf-8?B?WXVoSkZYNGdHMlZ1UHUrcWJtUnNYQkV0dWRReXNTRzB3TExVcU1nVFpmWVRv?=
 =?utf-8?B?bWthNUVteFZmNng1SWdFZVF0L0I0QW1mTW5LQzRmdnVqVFV2Y2dydkFnMVVV?=
 =?utf-8?B?WGpXME9iZFZHQXM2cW9VODI4d3pyK21JQVNWUVY1TFF3TFRCMFMyTjVhelQ2?=
 =?utf-8?B?OFZXWEVaWElSejduUS8ycEUzcVpubi9oWWdlS202ZDBMUTNUY0JUNWVBdnBi?=
 =?utf-8?B?UUFNbERGd1pHVlcvYlB0aXQyaFMrVFQ5UWhRcEFwUlFwSTcvRElGL1ZCZER0?=
 =?utf-8?B?enRiaS8raWZzQ0JOSlJnUVFQNDVnL0UzVzdMalVBc1R1cE90K3ZBZWg0ZGFB?=
 =?utf-8?B?TFBNek9LTVpKdCtTZDMvR2U1L2tOTHBQQTRHQ3oveXNXaDVua1FEQUhzY1U3?=
 =?utf-8?B?RE5DdXRIeEg4TmdtaE9CeTEzbjFMSDMyTEtxZ05zTmswcWFaTVVHelNhTWpL?=
 =?utf-8?B?bFNOVEZqaWpZT0l5S2FYUjU3UFZuVnBrWURlODhhcDIxaG9qUjAwdk1OV3pC?=
 =?utf-8?B?QkFidXRCU0ZzWEdQTUJqWDhzWTk0enlLZCtMSTFTZkdRQnM3Ukdib0N6dXI4?=
 =?utf-8?B?czhjRkJqcHhTOTJMdUtId0ZPVmJ5ajcxeFhzSERnQ3AvRmMvZlJlbXRvZk9p?=
 =?utf-8?B?Tmpyb1Mzc3A4SWFlc2FPZUhBR2VjMXV2RFBpcE5wemdlMGY2V2VYdVFvNEIy?=
 =?utf-8?B?UnVOQnB4WWROWFJ0cVZjWHlsOVRxMTBwd0xSYTMyVmZqbXZjUmE0bUZhYWdY?=
 =?utf-8?B?Y1E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cfdc6b4c-425b-418c-6089-08dda821bed7
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2025 13:21:44.6897
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uemyl6AWywbBcwpT95KVoZsztZkhEMxC32/q7e1ZVDMYh+uxYt/B3/N/keIveW9iIi1yBQJfXLXj7zxPJy5EywL8+QAqWtQb7/E1Qo7L0RE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7358
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Tue, 10 Jun 2025 13:21:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7051

Hi Antonin,

On 6/10/25 1:38 PM, Antonin Godard wrote:
> Hi Quentin,
> 
> Thanks for the suggestions, I'll prepare a v2.
> 
> Otherwise I'll answer to what I know the answer to.
> 
> On Fri Jun 6, 2025 at 11:25 AM CEST, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 6/6/25 9:37 AM, Antonin Godard via lists.yoctoproject.org wrote:
[...]
>>> +Below is a list of primary tested features, their maintainer(s) and builder(s):
>>> +
>>> +.. list-table::
>>> +   :widths: 20 20 20 40
>>> +   :header-rows: 1
>>> +
>>> +   * - Feature
>>> +     - Description
>>> +     - Maintainer(s)
>>
>> What are we trying to achieve with this column?
>>
>> What am I supposed to derive as information as a user of YP/OE/BB based
>> on that?
>>
>> Is this some kind of public recognition from the project of efforts from
>> some people?
>>
>> Are we supposed to be able to contact those people maybe? Should there
>> be some mail address there or some pointers to some document on what to
>> do if we want to contact them?
> 
> I did not want to display the email adresses of the people there without their
> consent, although it would be nice to include, for sure. I guess I can mention
> that layer READMEs should contain more information, including the email address.
> 

Fair enough, especially considering that the mail addresses may change 
over time.

Not sure the layer's README will contain information about machines' or 
some autobuilder builders' maintainers though?

I'm mostly perplexed about what is the purpose for such a column in the 
table.

@Richard - or anyone else :) - what is/was intended here?

Cheers,
Quentin


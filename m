Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3DECD3398E
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 14:34:11 +0000 (UTC)
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (EUR05-DB8-obe.outbound.protection.outlook.com [40.107.20.85])
 by mx.groups.io with SMTP id smtpd.web10.53332.1730126041953314427
 for <docs@lists.yoctoproject.org>;
 Mon, 28 Oct 2024 07:34:02 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=YR4XTn+P;
 spf=pass (domain: cherry.de, ip: 40.107.20.85, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cROJ1DTMaLSjN6vG4XZ4ugUW64DSEJYit7BehXnQ+8HkS2DCfa9yJZPVOCvg2t4MPzyspG99uH2yiwiJStqfg9Faaptfs7uPW3dk/kQP98lTa57SRUW7PpV9zs0YBV8+4qsAVnPfT4JG9lvJF1DAELdepXT8ljFGVxtnEy89rz6XNPEB39RJIRO4aknZzg7XnDvvqEcjRjddD6AdCvc/E4l446XihVCVdpwZu+yzfkEKzaucnjh6ud+EiZVm6uofzTHxmb6+aaBFLXfYlSi6CE47+qlp/FqhH7BztE6bP0hd9rLI/Yg/h9/FNdBVwXyyEgDc/fn4wq7lbEH51t0HRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=J1scbrDvsFP6Yo47uPP3pSn99hJdMXKVRGONQfSGlpc=;
 b=jLTCTQx2Pad9WLDF0tv/XfOVfT3uJfsDgglihTXOKgPnNQYv0Q2SlbY7YJRs24gTDV9i2SubPWMTVGxbf2OGmQVIFIPd0pkplCJ6X9gv0/DuUdeabscat1StgyT3pdVaxaC9ACDbE7IvY8O9cQglaBk1mBFQ1MeH47bKLV/s3BYXsTXdMSxgv1Frs0X15oCPMGeVVotNPIuz9yhb8lwznFYd3oXXDVGqUKKamZgxIA41qtBXJ1FFUhupeIo5bi1XYfQVzDUFflCfZmBtO5IPopGhQGMCHxlaWa9UQcfAEEM/1Z+XtBUwbO5vG65WsZ2dbMtONYYxJ47YUQCjgtaLHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=J1scbrDvsFP6Yo47uPP3pSn99hJdMXKVRGONQfSGlpc=;
 b=YR4XTn+PrvwsT8y3n0HtIACXbaYMkG+u76g/Nar5cL8z+3czDLxqOH1koBSZ3w3vwXzVCrxE140w2MBNPW5z3Iftbxrkq2SmbY++qt1SglSsRtxQmGeM/6rQmfx/h1AnQtUPu5HFsd9rhThetWlswlH0c32fmBd2g4ID5dvQBCQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by PAXPR04MB9448.eurprd04.prod.outlook.com (2603:10a6:102:2b1::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.20; Mon, 28 Oct
 2024 14:33:58 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%7]) with mapi id 15.20.8093.025; Mon, 28 Oct 2024
 14:33:58 +0000
Message-ID: <5540c8e7-9add-4646-92c4-e3068f5650f3@cherry.de>
Date: Mon, 28 Oct 2024 15:33:57 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] ref-manual: release-process: update releases.svg
To: Antonin Godard <antonin.godard@bootlin.com>, docs@lists.yoctoproject.org
Cc: Michael Opdenacker <michael.opdenacker@rootcommit.com>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20241023-update-releases-svg-v3-0-a8367b5d4854@bootlin.com>
 <20241023-update-releases-svg-v3-1-a8367b5d4854@bootlin.com>
 <04ae83df-db00-421b-9510-e246e8bc31b5@cherry.de>
 <D57HN7HBWZD2.3N3ZUTN2E6EFP@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <D57HN7HBWZD2.3N3ZUTN2E6EFP@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR4P281CA0178.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b7::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|PAXPR04MB9448:EE_
X-MS-Office365-Filtering-Correlation-Id: d965750c-c13a-4714-b283-08dcf75d8ef9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?c21NN0pNK285cnpWU3NXeGVHNlBzRHVSM3ArOVEzeEVzb05Ick5LU1JSQ1o5?=
 =?utf-8?B?bmsrVzJ0b1QyMzZUTExvNWRQVHJGMkRtUElTc3RGeDhXdk9PanVtSEhDRlNr?=
 =?utf-8?B?a1VZZE9mQStmdHdjNUt3TUEzeStDdDFWTEJ4Ri82amhGQkZ5T2FqdjhyTk9v?=
 =?utf-8?B?eUt6b3NaU29jR0pFZm5SUHh2Nzg5a1lFcUd4Tm5DTkIvRnM4NVJUY0t3N1VP?=
 =?utf-8?B?cHRJOWppTFdIMFQ3MjZpMU93NUZzVmFLWjVtTWQ4aVd5c05VYnM0WmdTOVJP?=
 =?utf-8?B?em1pNTY5aFZRamE5Um0rWnBQaXk1dkhsekVNWGovck9DeWFnYmdvQnhVVENZ?=
 =?utf-8?B?dDVPcnFIeUpPK0pJY1JlUFFabFRDU1plQWtQalk0emdPVmk3VWhXSzMwT3NJ?=
 =?utf-8?B?anl1ZnJDczV4YWxZM0t4RDBDbk82U0x6aEppTFFmem5tbUx0NUtSTE9JbkdK?=
 =?utf-8?B?eFFDVzJEbmY3SHFOblpWQi9DdDFLOEM5QmM1dEU5c1B0VXBGQ3B2dC9VVzdv?=
 =?utf-8?B?NDdvcDhFQzJYR0VCaDVLcWRIOTRtS1U2YjNod3RVdnhvdVc5UG9JVW44UTlL?=
 =?utf-8?B?R3dwZTV2MGZ2eXhudElNQU9oaC9nc2xaMS9hVCtqZ0J6NlFidllNbEJkazk3?=
 =?utf-8?B?bFR1RDUrR3c4akJTVTRRV2FWZTRsWFdJYkErOHVzQXBWUU9BVnppbG9PeGpH?=
 =?utf-8?B?UEs0dHhlTWZEK0FZV2FtQWVXdzZCVDFnTUNlWXpwSndDYlVBeHk4LzF0dk9a?=
 =?utf-8?B?UE95Ujh3QkJmbWxseDZGd1JZOVA2RnNJRGg1bE1YL3F5TU1tRExNVzZVcmNT?=
 =?utf-8?B?REsvNkliaXZQK1ZqeFh6K3hnSXRuNlhSSk1XSy9hQTZKZ3E1MS9JRVhIb3hB?=
 =?utf-8?B?SmVEa1pWNkwyVm9tbHdUNE5xVHp3WXF2QStyMVJTZVgzRGxyQzdiVFpqei84?=
 =?utf-8?B?bWNSMzM3ME9zRFVnaldwcnhtbElXMWh1Y3FkMHZUU2ZLUVg1bWM3QUw5Tmpr?=
 =?utf-8?B?RklKdmJkVjkvU21uMndOekR0S3RKTm9KZVVtSU51SGZEWHM0VzM4OW01SDBo?=
 =?utf-8?B?Vm1EQmJTVUJmendzanhXbEpWYzZodzIvVVF2RmJ1T2RmTldDQVNxQ3kzWjMz?=
 =?utf-8?B?cnFIS2s3cmwydFFhOHZPVURGUm9PRWFXaXJrL2hUNG1BaXFRMldKR1V1Skxh?=
 =?utf-8?B?ZlNwcE5wTnJBalZuSEJyWk5Ua295ZDV6ZWtKdUdnQ1lWQnlvQlhQcWZMRVJl?=
 =?utf-8?B?S2NtbEVXdElscEJrYjBPODBqUmd3Q3RTUDY3cTY1a0JaK2toQzNaMnlyVUlG?=
 =?utf-8?B?R2R5c2RyNTZrOWxja1FyZ2RiczFiYW04QWpnRlB4RWtnaFVqM212MmNBUmZ3?=
 =?utf-8?B?S2lFTmZJRk1tNkFQbWR5dk15UjJLbGI1Mm1lS1VQNUtZKzRGWkpjNXNZUG8x?=
 =?utf-8?B?TWtPTDRpUm5pNGxST2RoZzM1RUZvZ2w5dVdaaVVFMytFaXQ3Q2ErWTg1aVdu?=
 =?utf-8?B?MndHMjVqenJBcHdOVUVuOWdMS2dVaUVrWmk0RTVFWC9yM01HdVYxVlp0aWtQ?=
 =?utf-8?B?SlNreXNtMlYwZVlpTjVmTWRka2RHRkw1QUJFeXdQMllYY3pOQzRibFhXRVh6?=
 =?utf-8?B?VWFMaitWVXhtaWNkMjRnbzhWemU0RkxtK05iM08vb3FMcDAyR0ttYXFNYk5r?=
 =?utf-8?B?RG1CTWsyd3oweUx4S3RqamVFM2lhR3hhLzdaMzh4ejd2ZUVLZ0hoYnFwUkdR?=
 =?utf-8?Q?VDhJSDihQqbdg0NNQpU0A4xrPi0e1VjrXU4+paf?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UlVhSEIvWndnZklUcHUvaklXTXdBaTFyaS90dWE1VzhsY3o0cExPeEZRaUJ3?=
 =?utf-8?B?K3NPUHZmV1duY0RTdDB0ekgyOTdlT2dSaHBZczNtcFNINEQxaE1kTXcwQnV6?=
 =?utf-8?B?WFozTVIwa3VyTTB6T0pzM3VsRXdPQlRqRWU1UUdXVks0d2lsUHNUbnkvemRT?=
 =?utf-8?B?MHNoUlJEN0VuNDkvblpCc1hOb1UwTGJsRitPaVFGSW5BN05NeWVlcGJUQmhu?=
 =?utf-8?B?UFB3YTA0RUxsTlloQVlaS1lodkdsMXhxeGZnNHcxeERXMVk2ZmhlYzRFVW0v?=
 =?utf-8?B?MldGQllRQ2VodUg4bkg3UE8vT0trU1U5YUVnRkhPWGNSKzBzVmQ5MWRNbExJ?=
 =?utf-8?B?YUd0M1dPb2JFRGN6TXJ0d201N3ZwTk5mLy9Uc0MyTU8wSFJ1Mm1kU0UvSmlR?=
 =?utf-8?B?OFJLcEh6MCtaMmhndmZSSkhZTTd6ZWxycERhdU1BelhrV1BNcFpKWGlRU3M0?=
 =?utf-8?B?ZWNjaGZFQUVLeWlXdEFvZmhmeHIwSFNEQTF1SjJBRXhXMCtuZTBteGVzSVhl?=
 =?utf-8?B?c3JJSmZXUGdZNkdqNFdPR1krR2ZZV2FOaHZLSWlSNUQvRnZFdy8ydlpsZU5y?=
 =?utf-8?B?UUluSkovbm1mZC9HYWlCbDFXbUNQOUNLaFZraEc0Q1VhQVU2U0lkdEVBejRl?=
 =?utf-8?B?OVAreUQwZVVWeFo3b00vNTFtSE45MzJGeDNXT2pZdTFuRDROSmZmVEdjdTM5?=
 =?utf-8?B?UUNTRHRTeUlhZ05VaSs5bTBZZ1VNNzJzSW0wWWhlWGh5TjZicE1EV0kxKzZO?=
 =?utf-8?B?Rk11aHpTcXJPRWdRdkdTZWFwV3ZTOVE0TXp5VXRQdTF5T3Q0Y3F1ZWZRVzZY?=
 =?utf-8?B?bWo3Sk9NeWNkVFZVa1R4ckJ0OTlNVDJLSWdhQUNNYnF5Y3NKblhlcUJiVlZs?=
 =?utf-8?B?V2kvajRBc0NXelV5bjRCbXJOVGJuLzMzTVd4TmZ1WE12c0Ntd0FyN0RVNER4?=
 =?utf-8?B?dWYvN3BzOFlxWk4vZ1ZlMzUrSUNMN3kxU2NxbjJ2ZzlkVVV6bzVWVmswWUFw?=
 =?utf-8?B?djZXNnpyWG96TFZlSitjRlozRTRndGdLZU9wai9HWWFqNlZzZXpKMTJRMGxt?=
 =?utf-8?B?ZnhScnR2OUJkZElBQVlaUnQzS1hjaGhtcmJVREhmS2lrYTJoTDJLdlVwQTFJ?=
 =?utf-8?B?MDl2RTltaFlhV256S0JpTUFoZE5BWHpscTFPOCtKVzc3UllCZkNWYmJLaklF?=
 =?utf-8?B?ZC9HdGRmbTJESVlRU0o2QWdBVW51a25sMit3em1rdCtpN2ZMUVd6dkJtOFRs?=
 =?utf-8?B?QWUyUnp2REU0d2hGVTZqeXZqVFNaMGRhR0g2RERtbnhmamdxMHgvMDZsMTNy?=
 =?utf-8?B?UE5ZK2xWQjlmZnQ3dUxCWjFEQWV4WDhERERvQ3RKNEFaMXg2YnZST2JHUmpi?=
 =?utf-8?B?NDhjb01NVG41aVpuNkI3VVZsZmJCaDdiWWhIRXBKdkM4dTRiMEc0UkhnTGpM?=
 =?utf-8?B?Vm1uaUt1ZWJxcEpieklRSUxTNTdMM2orcVVpRG5aUDF5dmxnWWtVZ25kY2E3?=
 =?utf-8?B?dnlNN1JRR2lvcU5ybng0L2pUMjNlRmFmQkRWbFFJaFZrS1VMZlRhWnNFTnpz?=
 =?utf-8?B?OEhYS3Z6NFN6MlNZbnp2MGJxZDNQMy9WdVZxck9zUjRJejE2OEQxbGdoQzFH?=
 =?utf-8?B?bEl6RGxseUlBN1FrNE1tTmR5UWwzTFFzQmU2V29pdXozRGVZWVhJdTdzMWR5?=
 =?utf-8?B?cnZYdUdWcG1FZVBwOEJVZFRGZzEzR1RYQmw5RFdsV21JY0FaL2Y2UFViN1Ex?=
 =?utf-8?B?cjVZS0RFZWlLRnRwdDBROUJ1R1NBcGFMNGpRNHVuYkVNVExzcUZPdUFNTHBa?=
 =?utf-8?B?R2hjV0hQeXZLMG9sNm9sL2syRzdYVlBxcWYxdXZyTFVHRmFKempCdVpJKzMw?=
 =?utf-8?B?YlpiMWFGWFBBMFBHc3RqK0NDUWgyWXAvakVXcGp2NXZ3M1JHaFN4ZnpGWWZz?=
 =?utf-8?B?V3FvOHFCT0x6MXhNWS9yRU5pcWltc0F3NWxiTTNFNlBpeXJ1OFhCREVHY05t?=
 =?utf-8?B?KzQ4U1hEUmhGbVl4VW1EN2dGL0hmVk4xTnZWNVRvYityYThYSkZKNC9sNDdF?=
 =?utf-8?B?MndtckhqekpVcEVwTzNhQU1CSlpEVHlIZEdVS2JETmRkb1ZBVEdpSFVCY2V6?=
 =?utf-8?B?Q0Z6cXBzN24yYUhycUJWQUFBdnNORTB6OTlCazU4MXZkcnhVWWNIWnpLakVO?=
 =?utf-8?B?Y0E9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d965750c-c13a-4714-b283-08dcf75d8ef9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2024 14:33:58.4141
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MzOexOQF9x74Nly8KoTvuJypoNQRHGjXy14RGrvzLRtDPATYNdA3TfwkpIZlsXuF26KQRok38DfJ+ACTFHtFaFdz0SiNW531nTQSjJCZrPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAXPR04MB9448
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 28 Oct 2024 14:34:11 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/5605

Hi Antonin,

On 10/28/24 2:53 PM, Antonin Godard wrote:
> Hi Quentin,
> 
> On Mon Oct 28, 2024 at 11:40 AM CET, Quentin Schulz wrote:
>> Hi Antonin,
>>
>> On 10/23/24 9:32 AM, Antonin Godard wrote:
>>> * Add Walnascar release.
>>> * Remove dunfell, gatesgarth, hardknott, honister: these release are not
>>>     supported anymore. Start from kirkstone, which is still supported.
>>>
>>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>>> ---
>>>    documentation/ref-manual/svg/releases.svg | 907 ++++++++++++------------------
>>>    1 file changed, 346 insertions(+), 561 deletions(-)
>>>
>>> diff --git a/documentation/ref-manual/svg/releases.svg b/documentation/ref-manual/svg/releases.svg
>>> index 036aa467cc2e646e99bc407bbf0ea7ff8825f57b..b1036e066ceb65a7391cec616cb4304094728f3f 100644
>>> --- a/documentation/ref-manual/svg/releases.svg
>>> +++ b/documentation/ref-manual/svg/releases.svg
>>> @@ -2,11 +2,14 @@
>> [...]
>>> +    <text
>>> +       xml:space="preserve"
>>> +       style="font-weight:bold;font-size:13.3333px;line-height:125%;font-family:'Nimbus Roman';-inkscape-font-specification:'Nimbus Roman, Bold';letter-spacing:0px;word-spacing:0px;writing-mode:lr-tb;fill:#fffefe;fill-opacity:1;stroke:#000000;stroke-width:1px;stroke-linecap:butt;stroke-linejoin:miter;stroke-opacity:1"
>>> +       x="1659.087"
>>> +       y="-3.6722763"
>>> +       id="text1185-3-55-4-0-0-0-1-1-6-4-3-5-2-2"><tspan
>>> +         sodipodi:role="line"
>>> +         x="1659.087"
>>> +         y="-3.6722763"
>>> +         style="font-style:normal;font-variant:normal;font-weight:normal;font-stretch:normal;font-size:13.3333px;font-family:'Liberation Sans';-inkscape-font-specification:'Liberation Sans';text-align:center;text-anchor:middle;fill:#000000;fill-opacity:1;stroke:none"
>>> +         id="tspan10317-2-9-1-4-6-5-6-6-5-9-7">Current</tspan></text>
>>
>> This is a bit dangerous as "current" keeps its meaning while time
>> passes. So building docs from years ago from a tarball will still say
>> "current" event though it isn't really supported anymore. The X axis
>> showing the dates should be enough for people to get the idea, but maybe
>> we can also add the last update date of the SVG after Current? e.g.
>> "Current (Oct. 2024)"?
> 
> I agree on adding the date after current would timestamp the image and make it
> valid for a given date. I like the idea of putting the current releases as the
> most prominent color, so I guess we can keep "Current" but add the timestamp?
> 

That's an option, yes.

>> Additionally updating that SVG for all releases might be an issue. If we
>> backport it "too far" then the release of the docs will not even be in
>> that graph anymore, which is a bit odd. Moreover, the paragraph in the
>> LTS section may become outdated as well.
> 
> I would have thought that EoL releases would receive a last update that puts the
> color of that release to the faded color, and then receive no updates to the
> diagram anymore.
> 

You would still have more recent releases in the graph, even though at 
some point those also wouldn't be supported anymore.

> Is it that bad that reading the doc for an old release shows a outdated
> "Current" state? Granted that they also show the timestamp mentioned above.
> 

I am of the opinion of yes. Imagine a user getting Yocto from a vendor 
and the SVG that shows Current shows their release in there, which could 
have been EoL for a while already. It's not uncommon to have questions 
from people "stuck" on a very old release because of BSP layers from 
vendors which do not care about updating.

>> A random thought I just had was to maybe treat this the same way we do
>> with the migration manuals, that is to take the source from the last
>> release/master and inject it into all earlier releases whenever we build
>> the docs through the autobuilder. We could still have an outdated
>> version if people build it from an old tarball but there's no much we
>> can do about that sadly.
>>
>> What do you think?
> 
> I guess that's the ideal solution, and it shouldn't be too hard to add too!
> (especially if code already exists for the migration manuals)
> 

It'll be a bit odd though because people looking at an old release and 
the release won't appear in the graph.

There's no perfect solution that comes to mind right now though. Sooo, 
best effort for now and trying to not confuse people is a good 
compromise I think :)

Cheers,
Quentin


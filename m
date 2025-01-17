Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1234FC02183
	for <webhook@archiver.kernel.org>; Fri, 17 Jan 2025 10:14:28 +0000 (UTC)
Received: from DU2PR03CU002.outbound.protection.outlook.com (DU2PR03CU002.outbound.protection.outlook.com [52.101.66.60])
 by mx.groups.io with SMTP id smtpd.web11.7595.1737108857170259424
 for <docs@lists.yoctoproject.org>;
 Fri, 17 Jan 2025 02:14:18 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=mI7A19rJ;
 spf=pass (domain: cherry.de, ip: 52.101.66.60, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QAe8nVxivSftNWgqqyk74hUVfmkkAzwJAsg6DEQm7vC2usmP8bzMHaMXlryGQCAY3bi2lWJJ/41OqDUtilYRjKkf77xn5XoiuUwqEStfBGU7CXnTBgOaf17BuNJAHFbZM9FpvRVi1t4eu8mDtFPcCiyfcfekmfd9mSJhO2Yxxff+5sI2LjHW5weqqqtjehPXzPGfjEidm9aAyRMlB1hNe3yCXD1aCex4uHSFJ2WmRmU48O7pWO9AhoX3EN0m2dy4SZbOtoPvie6ZPV+1Urp3NdP0Feobd6nN5ene4A5gzROMlMqUVrVOy8DKqnwTCaajo5a2g8MP97tK/FMXvhYKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G+DrNrtmLCUENhJTf0PoxRMu9kHum5PasYJgAy6+U4w=;
 b=CGMI7luMjYrWHr2gLBusg4VzAxbVtsFoDhMQcbKvN1FXSMKHIFNvJlg3XPfJhOuEOsxSB1SusdMwDmAxv1irf3MZnF+D/KFvt0vR5qzKYlI/eWh1HOVGmDop1PR2259LzzZLw9X/reJrZ6UMPIcdUNarr4BnSSC3eX/TU6is9+Z97TlYTrWAbZY86csFRcKf6iBH0ePn+iPc4vRMbESJmaLp7gpcdEPBlcyqNRIZtnY8t5j62HcnjF8LzSK2iBtMc7WKcKfv0vWuYz5KR6MzWUFRGl9f96wG2Hp68LDD47rr8itiKOZRqKSxFXd/bCUfRLtki0C32UAX38VnMxD9Qw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G+DrNrtmLCUENhJTf0PoxRMu9kHum5PasYJgAy6+U4w=;
 b=mI7A19rJWI0wOdKkWaa7Dc0NMYywGi9Kse7JMx3F8kC1PxhjbuZzWtxGOyxN0iQkpGCH+H3InQsuZ4Vs1QFuVRVlwRf9bYTZTH9N/01ipwtLyz+YgNb32xNgDdaJNvArV7AXhU/TRYUaCqk1Q3LwsMqoQBeMvuJaK+8baWn/z/Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB9208.eurprd04.prod.outlook.com (2603:10a6:20b:44f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Fri, 17 Jan
 2025 10:14:13 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%3]) with mapi id 15.20.8335.015; Fri, 17 Jan 2025
 10:14:13 +0000
Message-ID: <c32c35c7-5835-464e-90fe-b69215cbf928@cherry.de>
Date: Fri, 17 Jan 2025 11:14:12 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [yocto-docs][PATCH v2 1/2] Update autobuilder URLs to
 valkyrie
To: antonin.godard@bootlin.com, docs@lists.yoctoproject.org
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250117-update-autobuilder-link-v2-0-3ca2d22ab24a@bootlin.com>
 <20250117-update-autobuilder-link-v2-1-3ca2d22ab24a@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <20250117-update-autobuilder-link-v2-1-3ca2d22ab24a@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR0P281CA0110.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a8::6) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB9208:EE_
X-MS-Office365-Filtering-Correlation-Id: bcfc2ffe-1c87-4936-00fc-08dd36dfb0b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?Q1B2aEZWSXJjYnJ6MUtJQXRkYTBWaytUMlFCaTc5cmlHOW1tTVMxaVJZSG9k?=
 =?utf-8?B?a3Rzbk9rb3llZXY3dEhkaFdWWXpGai8vRzdHdW5Ib1Q5Umh6OE1RMUM4Ujdz?=
 =?utf-8?B?czBKdEVwclpITmE3UUVHanQ5R2JNMnFRbzQwRUFuWnZqblE5Ykh2NGxHVXlZ?=
 =?utf-8?B?U2ZacVV4Q01lNHJ6SFRaaEZRVzZwK01HNHhCbzNDZ2o4ajZnWnVmdmM1Vnhv?=
 =?utf-8?B?STlha3AybXUvb0dXZGtMNTBYbmE2Z0szamhCaUZ2WUdTUHptb0FnNWorRjlP?=
 =?utf-8?B?M2dRNVI0K2JLOGRyaUxlaExqcWZoclM4WkY5Z3VTMFAzSVYvbVFwdFZjNERz?=
 =?utf-8?B?TnpDeGdDZFNaMTl6aFJlSkpXSUY0MUI1VHpNTnBzcnI4QTM3aTdKbHRjYVZU?=
 =?utf-8?B?Z2YrL1pEdnY5S2ZSeTVGSTA4UEkwZ1J0Vk12bXNnZFU1c09OVlBYUHBXNEhk?=
 =?utf-8?B?akE2K1FyZGZPZVc5eHYva0gzVnFQajFrUnFnV01tbEUwbGxmeGVWY1hjK2VP?=
 =?utf-8?B?NEJiWlpNOFI3cSsyR29oRVNFODFDdzBOa2JCKzZRbTAwbVdwV2pQbUlwb0cz?=
 =?utf-8?B?aUJDZWI0azFqUU9ic0x3clhVaityYXE2ZE5Gd3FLdllyMDh2aG9uSDBZMzRo?=
 =?utf-8?B?eG9teEpLSDdkbVFGQzBmTUNtdUR5MUNaNnMzS1ZYNXJNQ3FodWwvakVjbHlL?=
 =?utf-8?B?MklIczRkdTZ4WFNBNjMvd1JhZDJYTHJvM3BhMk03bTFqcFFQRkgzTlA1Tjd0?=
 =?utf-8?B?VVA5YmE3Z1drN2N2Z3AzenRQdm9GWk9DbWdJdVVIM2xaNTRtN2xpOXdPNmpV?=
 =?utf-8?B?WGhORFU5TG1vV2xibXY3dkVLR1prWGwzdWl2TE9qYWNIVWdYZlRURi9JNDh3?=
 =?utf-8?B?NFJvc2NvQVpuRlM3WnBScGpINW9rWE0xd3NkaTJkSFhTUkd2cEtGcStlU0Y1?=
 =?utf-8?B?M2lKOEh5TWRjWWVQNElHSGNwRzJ0YWNPclJTQVN4amo1U1dMWHhUa1ZYdVlq?=
 =?utf-8?B?Q1F6VDA2UGp2UnRsMjNmaEN3WStvaGcwaHBpRU5RVElFRE5YNXQ2TjEzOGJj?=
 =?utf-8?B?SXZRS1Z4b2FvRlBqK1dEd21keWdpWVBYdzVlV2lUVzR0S1ZuT1I2dG1JQ0F1?=
 =?utf-8?B?RWJpcGdMRjNtZmYydlgwaVVZcmlyM0xRV09JN3plazNFT01xNnpvY1VRV2RM?=
 =?utf-8?B?dFdoVm85NTZUeW5KZGRrMHArbzRQMXh4djR4ajh5b0k4SkYvd0N0cS8wbVpi?=
 =?utf-8?B?RHlkZXBPTTQrY0NLczVlRUQzRVFJL0RuRk1KRlNxbU1PTmZpb0pLUVhlbnNO?=
 =?utf-8?B?aEpBeVJTOHI5RHVsVkpHdk1YMEpGanJrVmZDYzR1UGFCTnQ5K3hndGRIYTNO?=
 =?utf-8?B?R09lby9DcmM0RmdxZVd0dld3MDlBUU4yRTFPSjd0Rml6U0Nsa3JheElmQmwz?=
 =?utf-8?B?NGI4OFcwSnlNeGdrYklwSjNXcGZ2YmhZYmtlUUdYSEo0c2lDYWRPVkxqVHE3?=
 =?utf-8?B?MmNrTEExVC9FbVVlNmNWRkpkcnFqUWFYRTF6U3A4RDBTQWR5QWZuMUhON3Rh?=
 =?utf-8?B?L1ZxT0U1WHd3a0MwQWV2KzIzTlJGUGlIYW1QVEpsdVVlWUxoNEpVaXR1MHBE?=
 =?utf-8?B?ejhoMUZSYkR0NWx4OTg4blVtYjJtUExhcHFiMWR1dzBUR0Z1dE0rckR0VENS?=
 =?utf-8?B?THFQUUNPekRvTng5QTBEbWhuRFB2RlN0eE94NVBna0dmQkt4NGZTLzVtanFX?=
 =?utf-8?B?MStoZ2IzRHVZSGVCVlB4Q3JBa2x1ODhTZmU4cnBtRTNiWlJpbVZRSlFneXZk?=
 =?utf-8?B?Qjc4TTRiSXpQZVc3OTQxUT09?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NWptdWV4R3Y2cUVRa2hrMWthZ2c0dnEwd0xjNjNURW9yN1Y2K0F3VTVMV2xu?=
 =?utf-8?B?eU40N1M1Vm9QL2FqeWg2YzNJa1ArbkVFckdOTXovTXFsdGErOSt2S1VZcW5J?=
 =?utf-8?B?V1Q1My9xRmkveUVWQXllWnFHZ1ZyNzZiSEFBRWh5VEJpa0pqYnpjZEpuNWJN?=
 =?utf-8?B?VGxGM1ExN0tqbXBNVVlPWG9oL0dPNXBIUEVTMmZIdEYvTXZpQUNvWTFKeUZj?=
 =?utf-8?B?OHdibGpTSzRubklOMGJCQUM0YitMc1FNQzAyK29sdlZCZkdxWUhadHl6SkJQ?=
 =?utf-8?B?MjFucGNFUFJ6d0VZOFZWTVo3Zndtd2VHWWFZQUMrbjY4VEMyNElxWlRXRnZG?=
 =?utf-8?B?M1pNVkwwQW1CTlZjaFVXYlY5SlpTRDY2NGkvWGROdFlvY2pMVi9NUXR4aVR6?=
 =?utf-8?B?aHpKS1FzTWlETWNqcWRoNkpmUjAvOEpWd010SnUxMTlVVndwbVpwTFNDeENR?=
 =?utf-8?B?bm80WU1nQ09WY3NzcTN3bHlKNE5kbmE1ZGRzZm1KT0VKMGpaa3NpaDJYT2c4?=
 =?utf-8?B?M1FOTHYyQ2lvUGt3M0g2enN4djV2KzVsUnhUSlNmNUJDQ1F2MWlTclkyY3A2?=
 =?utf-8?B?cFF4VHBvbFlGclFtRUMwQUg1N3N5WDM2bGtmTExHbUNWTEJSMWJOSjErRDla?=
 =?utf-8?B?Zi81L3NrV25mQUpNQ2hhOHpQaG4vbExXSHZJbi8xdjM4ZXk1MndvTkVqMjA4?=
 =?utf-8?B?T2M4eUhJN2lIS0wyUHUybXAwWHZkOUl1ck56cStxb1VyYXFkUFZqTkdnM2hP?=
 =?utf-8?B?bU9ZZGYrT2I0ZXUzUGh5Sk8wOEtEL1I1eHYxQm85aStwbzFBQVY4bXFGb1lI?=
 =?utf-8?B?dC9XOEVVWjA0MnhxbHp5UmR6Z3pDTktDVEpIVmh5ajRYdWN1dytkT0ZETzZO?=
 =?utf-8?B?ME1yRGw2azI4RHhzMlRONkJwSHA4YVgwZFUzc0tXVjZCOTFKODZDdnRicHhP?=
 =?utf-8?B?dWxNTmpIWXlYVHVlYjZMRHIwd24rT0djVWJDSFlSNVlGTUZoMVE5ZXJ4ajdD?=
 =?utf-8?B?ZnhrcjFMQ1JKbUVQUm4reEVSOGlqWEM3KzNzR3ZaLzVnc1hFWDhVMFc1bjJz?=
 =?utf-8?B?N2dGK05vRkRpRjBHdHZQWXAzZU1aQ0E0WGtWNnpvQXM2aUVLQkpXbURTOUR6?=
 =?utf-8?B?NzFmcjlDRGFBVnd1TEFrZFFKS0pjVkU0cWdOOVF4QncyWkV5YUNBcHg4d01U?=
 =?utf-8?B?aVFROUtacHRmMFkxWXJpSkhvSklRZnJWSG93YXV4ZDhqWmhYYnAveXBQb3ht?=
 =?utf-8?B?enpsVDBkQXF5dDRYUVlFbUt6R2RJaUNiWTlUVHpwdU9EcUFXcU9vQjNRbEdK?=
 =?utf-8?B?T0QzNE5EaThkZ1F6WStuU1ZteHJYMFNjVzg4VUtpR0ljM2RHOElsamhRVzIy?=
 =?utf-8?B?Mm9aU1p0aTNtdGJNNk1tK1BGYkRsaFkvaWkweGh4R2N6Q1gzNTFmMy9sWlpS?=
 =?utf-8?B?RFUveWxYbVgxMjVFbDVEcUNNWEpJc1c0ZERIZW1IZ0lJVzhxMHQxNUxLUTRn?=
 =?utf-8?B?Mjc5bjREc2R2WTBaNnJIamQ5UHo2c2htMjlmbGc0QzNKVmhVeU5UZUJMMUhT?=
 =?utf-8?B?dkZUNlJpNjFjcmIvbWljbnJwWkFqVEt4RnQ3Mmp2SGhOTGRHc1dQeDJaRUpx?=
 =?utf-8?B?bDUxZEN6K2dkUGlheUR2TlUyRU82ZG91SWdFMlBvUUEwK2hUcmQvak1DRk1V?=
 =?utf-8?B?Ymc0UWo3VENVQmY5b3Y5aFplRzFvOTQxTVZPM3hSR0xaZ3hVM2dxcFNHalZB?=
 =?utf-8?B?TldQanB2c3ZIZER5L2RCbk1qei9EZDdQVmpmUzEveHdBVTlOZTBJL2F4d001?=
 =?utf-8?B?eDhTUTFYcWtGbm0wOTNQbWYrZUJVNUxKdUpuZGIzY2RpSlpiUmZiMWlqTzFU?=
 =?utf-8?B?ZFdqTEFETmFPN2JXSXpRVFN5YmJTRkZubHUxUGs2RTExdFNCWnZCc2NnUVls?=
 =?utf-8?B?TlFnbFdYZFhwTm5VbWJ0amU3V3lVRE5jZDAyTTZmRktpMzNIWWJ0OGRLVEVU?=
 =?utf-8?B?YWUwOUxDbnBFZzYwbEU0WjJtZGUzR0RkYkZPSExOWXhaeDdYUUx2L0N0cTNt?=
 =?utf-8?B?Zzgva25vTHlub2tOTU1HaDY2UThSUG5oUmlLSzdHeDJyU0gvendlSzhkSHox?=
 =?utf-8?B?TTJ2MGdpWmRWeXBCRVl5S1VuVXNIT1FQRDlNczIrTG5DRzdmL2FSVUFLV1N5?=
 =?utf-8?B?OVE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: bcfc2ffe-1c87-4936-00fc-08dd36dfb0b9
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jan 2025 10:14:13.0747
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qnPo02PtPCMVYBTuToB7UKBnwTnnGoYpjHOu3C5kVWEWkVf/7RA4UnnINE7JrvWHA/eiv84MJKtreeYwuQLUVhAA6DuDOIDSC1LMRro1uTc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB9208
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 17 Jan 2025 10:14:28 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6125

Hi Antonin,

On 1/17/25 11:08 AM, Antonin Godard via lists.yoctoproject.org wrote:
> We have moved to Valkyrie which is hosted on
> https://autobuilder.yoctoproject.org/valkyrie. Update the URL in the
> documentation.
> 
> Also, the YOCTO_AB_URL macro was used in a single location in the
> documentation so replace it by the :yocto_ab: custom extlink and remove
> the macro.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


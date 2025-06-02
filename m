Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 80367C54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 13:25:46 +0000 (UTC)
Received: from MRWPR03CU001.outbound.protection.outlook.com (MRWPR03CU001.outbound.protection.outlook.com [40.107.130.9])
 by mx.groups.io with SMTP id smtpd.web11.49768.1748870738729874278
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 06:25:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=KvddGjPA;
 spf=pass (domain: cherry.de, ip: 40.107.130.9, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MBMHtFxt3/gixzp+Z6HRdFEfHlzdd1SKWMUENcoy/92qhicFdswM35eFeLvjPmBBOmNP7Dlboqs5Tn1kZhUo2EBwYAupBhqXv/VymmS3oxXNHiN5jFwbJuQUR57wqnveLCz71apCmj64K7tmFkFeSAz7JImiwpns4scTKpqK3pc+DXLeHTQYT6TXRGAYIW0OzJonluFhVng8u+Opse0buuGJheul7RCDtE7JT0CzKsduTHUlEiTvB1fFuZceSmdvjFdGd/k4fnXmsiTgA6jF/h40canpw3VxEWaKvUT8ASsWQ1Vt7Gcyd08pucrU5ugyr9mx28rUbMiykZcOBSveig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zbFBvmZ6cPsSvFaBhSUQzCuvhN5NhlyAtIR26Zg69k0=;
 b=TN0JbxwvE7oPnj0VSJUvr6DDjpMT9AXCJnU54mNqkEUNXSvgCYdSMc2KEgQEmixlFmHK3Slht4bH54Ibad/yRcnc2dW3CsRVl4DeI2Tbp6vVQ/lwhr89Cru/sE/HErHrt0O6PfCc0lseTrF7pNQPgt4avd0j/JrZAwACWxJexmz2G0ikAreBmYpdcngpGY/5uLmMv+9nQ0Pw7wr1kYPqMSoxq+z6LBIvPuSewrvz2zYfPX/xV8JCt3LECJ1CJVLBLlXX6TFSI6px7sXnY4YjdDIeLeaFzh7+OdOql/AnZE1xkF5PMg9FIYjjeiEPuJUT9glkcKd9YUvG+9w1yiU0Tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zbFBvmZ6cPsSvFaBhSUQzCuvhN5NhlyAtIR26Zg69k0=;
 b=KvddGjPAZCBIoyCQVDSmpbxHJOpw4434wokSUBJzb2/GCsL1X0qh9j8VKtdAPJfZwotuWrtEFCmFUF3KVwDqNYQz+Z/3z7Vw7nuYTesEZTQARFDSbLep1knNW8CuwEZrIXw7YPugArTwgpXPIgDipwO++c4QAeUoEzypcOXFDbM=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by AS8PR04MB8755.eurprd04.prod.outlook.com (2603:10a6:20b:42e::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Mon, 2 Jun
 2025 13:25:35 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 13:25:35 +0000
Message-ID: <413fa053-e673-40fc-b145-399770fa7ac6@cherry.de>
Date: Mon, 2 Jun 2025 15:25:28 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] Update Ubuntu essentials list, replace liblz4-tool
 with lz4
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <6f93430f-7953-39b6-caf7-b144f37ab657@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <6f93430f-7953-39b6-caf7-b144f37ab657@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: JN3P275CA0118.ZAFP275.PROD.OUTLOOK.COM (2603:1086:0:d1::12)
 To AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|AS8PR04MB8755:EE_
X-MS-Office365-Filtering-Correlation-Id: df470106-69a3-43d8-386a-08dda1d8f4bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?UlRwcnRjTHNyaXpYc215S3FVTy9NbWU3ZC9XRWtJdWxjRkhCYzg1eit2STZv?=
 =?utf-8?B?VjI3UUVja1lmMHpra1FrbHZxeDB2NjZVVE5BSmxSdVNEMm85ZUdiODAva0Jt?=
 =?utf-8?B?cjduWDVqOFdwTmF1bk4vc3lUNFNCNkhTRDd0eEk1WGtPdENKNmtlM0ZpVVRk?=
 =?utf-8?B?Vi9ZajcxUE4rd0xFZEhORTRqYkRFNGdFV2RVamN4cmNqZG1zZjRWdzFqSHVI?=
 =?utf-8?B?MzdJZTR4cTQxOFZMNDc1bkRncDhsZGF2cDdQb3FOTTZLMHVHalBWNkdBQzB4?=
 =?utf-8?B?QjVlU0xjbEE3cEkxUlp0ZmNGY1VwTDBha1l6Ulpuc2toSE9hTEduVGpwM3Ju?=
 =?utf-8?B?TTFncFNYcUp5em5tNmZnWHE4YkI0YmFvdzBTTEhMYi9LeDVkb2pVeVNpYlNp?=
 =?utf-8?B?RWozRDFkay9XcGVOalpGYnU3ZzdrNkg5QVJBdGlSL2lrWVNvYmx6bEdmK2I0?=
 =?utf-8?B?OWJHd1dDU0kxaHExWXV1WTdZZlFld0ZmS1paaGpZWDZzS0FtQjcveHJPTVFl?=
 =?utf-8?B?UlF3SzhaSG1xWUJlVm1WNG5VUXR5VkkrLzFkNUM1YjgwSFc2K0t2a3QwRXBY?=
 =?utf-8?B?MDRNcHAwTTBIbSswbFJld202d1VVbnBkeXZxT3FJZVRtZnlhMEZHTGk1VzNS?=
 =?utf-8?B?cXVXUTNrdGVBSVZYQUduNWN0Y3E1NlpZdnRrSFhmbVdPZ28vc0RWem0rTXNW?=
 =?utf-8?B?TXkrYlhBZVFVV2MxMUlDa0tUcTVJT3dSai9DMXVOLzRLNkRmWTVIdnY1eUUw?=
 =?utf-8?B?a0Y2Z1YrL1B0MnRudWJhZURiVTdJRnZSVkVCOTRZNUYyZCsySzMyRVBTT2gr?=
 =?utf-8?B?UTJiZVVlSUdnbS94LzdYWHFBTCtuRWZ0aHQ2SGdvU29SbkhwRHk2dmlIQjE0?=
 =?utf-8?B?ZlBTcTJsOHJ1dy90cldIdDBHLzNxUzQxMDA1UFJuNjlXZ2tPL3hNTE1ldE0x?=
 =?utf-8?B?MWR4TVQrU0NUWmMzaFJiVUpOZ01KZDltQmdOblhKTjRKeHBHNDVzUTJpaVFr?=
 =?utf-8?B?akNvaDhiUFNIQUFQdzMwZ1pyblNKM3NNRHliQnpOYmRiVGxlQU5lRS82N1Jv?=
 =?utf-8?B?U2xDRGYzZ0xWbFBJekFMa0lYL05FbTMxQXVDdkdROGtNSEE2aWFmbHhZcXk3?=
 =?utf-8?B?c0piR3d1Sk0yM25qYUI2V2xLbFJ1K2JpaC9LcUpTWHFQL3p0OVUxaXFLYnZr?=
 =?utf-8?B?SmE4aDQzMDBGMndxaVIvdms1ODZTaU9Fazl5aDV6SHAyeUpFNkFZQmtjclVL?=
 =?utf-8?B?QjR5NHM4REhDZFlWWnlIMkk1dmxtZGNFcVhUbGMwVXBtWXBZR1l6K3pWVU5K?=
 =?utf-8?B?WWpZSHllNjVXWWFYekM0Yy85UkFzb3hqWXNlNzE2cDFlZnFqOXZyMjlVMHRi?=
 =?utf-8?B?bWtjQ2hiOGpDL3RhZHJPSUcwdkE0YmlrYzhNWk1RUlZXVWZTSG9qSjRULzYr?=
 =?utf-8?B?dnZ0U2g5TmpHZmJwSG84N1BHRVhzTU5WRmZhT1NGTnJSQ1dYeDZOYjhQb0xO?=
 =?utf-8?B?SGlmTG1MYmRzbkhCNUZvM3NqVHpjTC9DMXVPYjhUOTJMWng4R0dyUWpuUEN2?=
 =?utf-8?B?em0wamRBRDRYb1YwK2NxUDFuendycmw4aFlwVnhON2dKanhNNko2S0VGNExR?=
 =?utf-8?B?R3RSNTBpRmVKaTdweis3Z3p0bFpYdVdEdVZvS0sxY3R4b0M0MFJ5bjVJa0x3?=
 =?utf-8?B?NTc2WEJ6OEpCYkVBTkE1eVJMUVREbitiR0N0VEtONUNsTitKUXJJRkNJcEhi?=
 =?utf-8?B?YVJzeCtlUDhSNFIva2RQdEFHMncvOTZiNFlRTnhETFBlWWR6T1FUQ1AxSy85?=
 =?utf-8?B?SHZuOEFOZVdGeXJtSTJ2N1o0SmI4dzlVaTVJWW16SjdKUzBqSitXVmIwdHFU?=
 =?utf-8?B?U2dBNUEyRXc4SUt4eTJUelcvTWI1NVJzTmZOWHlIcU0vNG9FWmEwZFY3U2hq?=
 =?utf-8?Q?3eQuwa1sq6M=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NHBCYjVaVFBaZkhRQm5VR1NIRDI5VUZvYlVvNjlBeVZLTlhMMm43NjJFdHZN?=
 =?utf-8?B?NDMvQUFuT2lXSWF1d3FVWUI4UXlGTnVrajlwVW1DMTNIQnZ2QmN2T3lJRU9Q?=
 =?utf-8?B?TmJwRVYyOWd5M0l1UXpaVXQ3TUtRVXl6bWRuNDBKV2htU1RORTRxSUp4WHRZ?=
 =?utf-8?B?cEJKUXpxa1pZV0RLUGoyNU80WkZNNEpJRzloNnBPaTJlVG9BZ1lFT2l0WHZD?=
 =?utf-8?B?WG1nWHRSQVRtZVZsQUhJNThsaGh1SnV3YWd2WHlkcG11MzAwUmpHWHFLbFNI?=
 =?utf-8?B?Z1piWXQ3eWZWZzJ1RW5OVWZEQjcrS3Bja1JPVU43ZTVHdlBCaE9mdExCMGdP?=
 =?utf-8?B?OXBZVHV6MTd3YjV4cmZiY2ZFUlhNUVUzcFZCMVVZcFlkZy9PaXdZNkNjTDNO?=
 =?utf-8?B?bmFqT1JhS3crczMxcmducGRoMW16UlJtMGF5a2tJdGo5U0tGVXBHR0xXWkND?=
 =?utf-8?B?eTkwYmJYbjl0dEFud1Jqck5rT1d0OVVubmIxVGYyZ1Z1NG9BcnZNZzlsRUU2?=
 =?utf-8?B?TDZEUVFnMlA5YU1mc2w5ekV5cnppNmZDL1VoaGwvdDFjb08xNmR0L1B4RDJk?=
 =?utf-8?B?dW1YbGFHTlA0UmtLT25VV3E5cHE0U3RsZVVJbDJ3Zm91cGkxazJDNCtVTUlS?=
 =?utf-8?B?Z1l0R2V4V3FhcE5kN01tZWZUSTlCN2dtUmp0QThueWhmOE9uVWJtbUlTeWNV?=
 =?utf-8?B?RGV1KzlKTHFQeitSME8wWGcyMGRsUCtqYWRmUHF1S1JvUXRsNmFpLzhqMU9L?=
 =?utf-8?B?UFhGemFjL21rdERzZnNNTDdUTGc2RnVYZGlBOERZMmxmY0xITnFySDlIeWdl?=
 =?utf-8?B?RnYzc3pNQy9DTzIrS20xZmFJZ1VSVE1jOGExcXBId3FIcFZTY0xlU0k1Vy9z?=
 =?utf-8?B?M3pXVGFSSXNGMERRbVROSS9lcjI2d0puNWM1YmptbU9Sb1g4YW1zWW96dHdF?=
 =?utf-8?B?cVduZ1M0d09JUzNZV0xpY0pjTzlzeXBQZWJIZlZzN3ZzdFRydE9DOTE1TWZZ?=
 =?utf-8?B?cHlTRjJnNHQrQnpHTzhTVFAvVGliUDZBK3BsSmVrRWV0Y1QwcVVldmwrRHVP?=
 =?utf-8?B?T1pqUTd1bTNwR25hTk9IMUgzcUVrWktlaTF0MlR5SWVEYzRCWHRZeXVKNUky?=
 =?utf-8?B?RGFHeGJKcjJYRHdKSndibGx1K2Z1NzZPRGgyd2d6SjBYRE1kM2lFa0t5MWxi?=
 =?utf-8?B?eWRNTUJZblhteXJQMGExUmhOZFcrOXZ6N0RDcTBvUUtqdTM4WXZSZnAzK3V1?=
 =?utf-8?B?cTlINTRoOFo0cGxvelNQbVgwZFo3QUJzZ1p0SXcvQ2VobnR5YTFrSDlsQ3lu?=
 =?utf-8?B?V2swaW0xcUNzU2kramtOTW9OcHBMS2Z4RTMyTVpTNHE4b3ZPL3NkRDVhd1R0?=
 =?utf-8?B?UUl6UjF3Kzl3NmlKRGN5RVZiUHBUOEhremVic1pnWExsekc1T0hldU95VjJ4?=
 =?utf-8?B?ZVF3Ykl0cTZqaTNDQzFUNW9tdFhvTm9DaEUyUXVMQXNUUWpFeVFaa3lURXFH?=
 =?utf-8?B?bDJ4cnBySFpMQjQweW5MVjVybThoU0JpakpzV0FNeXprRmk2NUdQSUlDSzF3?=
 =?utf-8?B?bjJpOS9oU3NpSlg5UXN5RnQyUzFhVGkyWEt4TWhGenRmRFljTCtIc0xsUG5Z?=
 =?utf-8?B?WDhsVUNxQ0hCYWs4a3ViNElPc3ZuTTNLeWtVT1J4QWNlQUZGc3Z0Rm0xS0U2?=
 =?utf-8?B?Yi9YWEZnNGR5aDdQS3FORWttemFIdXNQd09PYzRTckVqb0lTbXhTRFlWWVk5?=
 =?utf-8?B?cklURjR6K05pMDd5WUtlZUVpaXl2S2M3R25lOW1adXBnM0N2a1p2MzUwaEVJ?=
 =?utf-8?B?RENLYVNJL0tIQ2QxZ2VFN0hYd2lpR2NNdDNVcTlhSEQ1cWhYM3hhbXRMUnoy?=
 =?utf-8?B?aDVkNWNoazU1WFVOWTc2VTNTRTR0TmpuMnUyQUxoY0libkRzbmxZN1p4MDNO?=
 =?utf-8?B?Z0YybjdQc3VOUG1mSDhwNitTWmZJYkUzT1NPNUUveWRZOUpKQzR4bXhOZlhK?=
 =?utf-8?B?RVRSK2dtZnVZTVJQak10UTlROGIxNWM0dWlRNlhsVDdaNm1ldHgwM2xkNGtX?=
 =?utf-8?B?alE4OE9EeDNFbWFOUFczcUlZMEJtdWw2aDk1aHdaYSs0a3BONDIvVXZBR1JM?=
 =?utf-8?B?N1pSTlJkalZQVURqeVpkR2VTcENjRTIrcWpxSi9kb0FRMEZEU1JLVTF6eFF6?=
 =?utf-8?B?VlE9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: df470106-69a3-43d8-386a-08dda1d8f4bf
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 13:25:35.0378
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: auQvmqsYyrXH3nNp/2wycSk8z0EJE9tNsBdS6Reh6DJYSHn063WV30DOL0SyatkwqfULxuN8Ekcv5bRLzZvSQUbyU5kDsHsXQ3IwKNWs638=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB8755
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 13:25:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6975

Hi Robert,

On 6/2/25 3:02 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Update the "Ubuntu Essentials package list" by replacing the obsolete
> liblz4-tool package name with the current lz4 package name.
> 
> According to Quentin Schulz:
> 
> "According to pkgs.org, 20.04 lz4 replaces/provides liblz4-tool, same
> for 22.04 and 24.04 and for some reason, liblz4-tool requires lz4
> package, so I think it should be fine to replace it yes.
> 
> "Debian seems to have the same packaging in Bookworm and Bullseye, so
> probably fine to do the change. They only seem to be adding a
> changelog and copyright, and require lz4 package in any case."
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>

Thanks!
Quentin


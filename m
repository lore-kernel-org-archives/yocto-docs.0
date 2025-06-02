Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F45C54FB3
	for <webhook@archiver.kernel.org>; Mon,  2 Jun 2025 11:43:46 +0000 (UTC)
Received: from AM0PR83CU005.outbound.protection.outlook.com (AM0PR83CU005.outbound.protection.outlook.com [52.101.69.48])
 by mx.groups.io with SMTP id smtpd.web11.47611.1748864619855815610
 for <docs@lists.yoctoproject.org>;
 Mon, 02 Jun 2025 04:43:40 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=an/IaEyU;
 spf=pass (domain: cherry.de, ip: 52.101.69.48, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r3MnUSs5+5lclM1lB4rRjaK5kHeW3nHsTSdBKrKhEX0kdomQ0V/t11P5cl3W1tTIBC+IRm6cJVbHSesrQ3z95to+SBqOuLLMBcQHBhBdtAczunJZpnVnIAvdYM5PgzrMIdX0XpQItXPO0+yr7jM2h9i+6QAQufFuHIwLHu0EjLVf21w85e2EG20rGEM50XNQB736TJsZf2cRmgcZAoZCrO0aIcI7SWC5JWT9CTrPx0Okdhx1zbb/LVYq7DvmT04yYOBur9TIqDc+o0T9rNL+Mr+N2VBcgELKl+h73X66Dd8ulSbuVDUrKhMiY3j8Xv+n3SUyIZ0bweULCWOH5w2Dgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JneE8jf38HU3siqCTKXPQ2QJRfIuoenxKMrkMuy28rc=;
 b=Jy7JEo19PWYkWok+lS9pU6mb4zGSGtrdk2YUoC6hv/PsbFEdzPhgWbZvTWG5f28XZDxxb+1w1Yd4r4d4OkJCOwGZfgJMSFcSFq2GuzDjKzu0Na4Qn11MZotcv0soXkjW2C3L67q3HumRqXTPkAQs3qKQCIvnqb9/BBNrsoXt1scwspmUMthofRls8IgoB1CdTI10Og+LGqQ8kSnVZFs0maUD0fSyoNkl1xCkmc+rgUCyY7j8yjlJ44XmV0U6FmDCqjW/61vgMyKfKuaRzPXRgcSLgfVkO2v6HIFPVEzl/g2L6P6QvHWq4n84IM2TQctyRm3jbmqAhbkKcXLQ9mubGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JneE8jf38HU3siqCTKXPQ2QJRfIuoenxKMrkMuy28rc=;
 b=an/IaEyUw7gzRPc5p1GGAl/Uze0//M4ptfZLUfwD4PtNmAS8GpZW+4AtXNBaQgc2cC1WuGaOsguxHAecZKG0Rw28BJk5aHjygIJNS76Y4VSc5zC02qr3Kpda5+Z3RxeNdOf2snWsFEnKykvduEfwX66oEX+ldFjQ4/IA5o3TDy0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by GV1PR04MB10918.eurprd04.prod.outlook.com (2603:10a6:150:207::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.33; Mon, 2 Jun
 2025 11:43:36 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%4]) with mapi id 15.20.8769.037; Mon, 2 Jun 2025
 11:43:36 +0000
Message-ID: <1ef38e13-4249-4511-a6ec-79db486b4438@cherry.de>
Date: Mon, 2 Jun 2025 13:43:35 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] Quick Build: Should "liblz4-tool" say simply "lz4"?
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <b02ae2d8-3b30-91aa-f71a-6d0101b5c033@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <b02ae2d8-3b30-91aa-f71a-6d0101b5c033@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: CWLP265CA0386.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:400:1d6::19) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|GV1PR04MB10918:EE_
X-MS-Office365-Filtering-Correlation-Id: cb208bc6-2f08-48d0-26e4-08dda1cab60a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?OU5GalROckU5cUlVemY3L29WZ3FaM0lhRFhkekNIZjZWalZtYUMwSzRJL0RV?=
 =?utf-8?B?enNDN3RXbm4zRnRjSVVxTDBqczFsb2Q0V2Y4SU9SQ29ySDNzU0hCOVVlL2NN?=
 =?utf-8?B?eWxDMmtGNUxCSXQ1ekVwb1J5VUZsTEJoUTh1blMwSTZWaVdhN3k5TGVlbmFH?=
 =?utf-8?B?Z3JNL1RKckJsb2ZGSFBNaHlZOTdBQU1jdEgzUnpMYVRvcmFpZjNEdDFySG56?=
 =?utf-8?B?VjJxTXd3YTVtU1hkM3VWMTExWDM2WEhkd2owcEsydk5aT2QxNm1tM0ZWYjI4?=
 =?utf-8?B?eGEva1V1QWFUVW8vQVJCSnp2SE00MElHTjdHKzdtNXFoUFNDWUVWUUx2UXlZ?=
 =?utf-8?B?SWxacjJqbUl4aWpKWDZrRWdLUkMvQ0tLZ0kyVGRrTEp5M1hvMUVGYjJkMExx?=
 =?utf-8?B?MisxaGtwdHhnWDROQUFwcmJWRzl0cG1oSDZmWFR6QVpmOUE0QVJnUStoV3lo?=
 =?utf-8?B?UzlyNDZrZFhGWGRVdG5wa3BBTDlob1ppVVFaV1RxaXlBeHlaTVVjNXNibkEy?=
 =?utf-8?B?RlRTWEtwNGZQenNmL2FZYU8xbTdxV2ZMeFJ3MVVicXl2djFCYS9CNnNhVllX?=
 =?utf-8?B?UnhMdStIdExvUXNaUGhzRFFvMTh4VkdHQk8wdFp3dmFBZ1JMZUw1WHFxQ3Rm?=
 =?utf-8?B?K1FpSzFFazhndTNETkdpbkNTTUo2dDg3NXFvWVJlMjFLZlpqNUUwQXBhelB0?=
 =?utf-8?B?czkwd2t3aEFMU2JxekZtcmlrRVF6KzBlcW0vT3hJQkx1Q04xZmdWQlZ5Z21E?=
 =?utf-8?B?SXhBQWw5NUlMK2FlTlZNRjd3eVNqNHdSd2d0V0hRbjdaa1NqNXFNVzFoUnZB?=
 =?utf-8?B?QWlxZ3grTWpadHY0cDlSS0tVd3ZWZEkwb1pDTS9DczIycm1yc0l4Q2E0TFlU?=
 =?utf-8?B?SkF6S29yU1lkbm9QSDRkK3pkcWFYdlNtNk5nWjlLWjVwL3dDUEU5eXNYOTND?=
 =?utf-8?B?TlZpM2wxQnI5QjVOL1JYZkRKWWNreEdQa2JhMkJqdzFTSXdoWFBmb0xuN0l4?=
 =?utf-8?B?eHJESkpqYmpFTis4emxsZUhzWWhER0NBYjJrTUJsRUtzVHZ2dndVR0tjMTdm?=
 =?utf-8?B?c0p1b2tkNmI2ajdHaWFtUjlLWmVPMExZWENYRUlJTUk2UWVKcFJFREhoWGxw?=
 =?utf-8?B?bHNpSkpBNmwzVnpGQVlWelFyKzV1Y0p0OFdTbmZNOW11allOYU9jM3U5Qy9x?=
 =?utf-8?B?TnB1YlVWYWJZVUkwNDcwQnMzWFJObTZUb0tnRGs2RjIvODhVaDV4M200Mk5x?=
 =?utf-8?B?Tzg1LzQrOGV4eTZKTitsa1BOMHprVTZlazVZK3FoQTR3dnN3QUlSVUd5QWhl?=
 =?utf-8?B?Z0pWYWRZZ0dhcXUyZHdldjdjZTZBaTdWR2FzU3JsYmh2TGZVY0ZidXRaVlY0?=
 =?utf-8?B?STJuTFNHaXUrYmduUmNtZVpHNmhQYlJrbFY3MlJkWkdnSmVXR0NOdFZYemlo?=
 =?utf-8?B?ZVpqZ3FDbVQ0R1oyc1hLQXNRUStFVnc3NHRZU3ZGUFZHREdZUW5aeFBXR2V0?=
 =?utf-8?B?N1pNUFNnY25ORW5WQmo0dmgvdTA3YlVuTXM1VXFQc3NCNWZwM0RVQkhpbWR6?=
 =?utf-8?B?NjAzVmZGSmF2QkFMT3N6cFdENHRPUWZQcXNVbGJ6RFZ1Rk5CeXZxZTZpVDJC?=
 =?utf-8?B?ZWs3a0VnYUh4TGFNOGc0WkNwZHJLODA2TkJHQ1JhUkIxVW1NdzYxZ0VweVpW?=
 =?utf-8?B?VmRITEZ4YmZGclZFUEFwWDhoN3ZlWkFwZE1BWDJvOHRDa2V0WlVwOWl6S3Jm?=
 =?utf-8?B?VjZjV2Q3UFc0TENqYnQ2Q2RLSUNNVGZRbnJOcXNLVHUrWDZrZnVjNHpJNlNk?=
 =?utf-8?B?c29oMERRTGVKVy9wR3NYTVBqSVFpbEZ3WXM4NzRiNXJocDgrMkZmWGxtMldv?=
 =?utf-8?B?Y2RGV3hXckYxVHpOS2tkdFVER3lZSjJxR09MK2dVZ2cyeWQzeGppdjl5NmdL?=
 =?utf-8?Q?vFECUNwkzmY=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NFpYOUJnKyswRW1Pb2V0RUdod0VSN1Y2eDRsNzFVKzB1TTBBQlU4cURKU0lW?=
 =?utf-8?B?aFd3V01pajl4RVg3S3RWUVJjcTNNZDlUaWdQdFBINEFQZUc5OGxMcGNFdGly?=
 =?utf-8?B?dHg2RHNONzVQbENkaVYwSldJU2JaOGxyTXBjNmtpWlo4QXVLYWdWeDZIWWFF?=
 =?utf-8?B?ZXlyMFU4cGszbnE2a1pzWXYwWDdKWVd0NFprTWM4N2pjOWkxZXRTY1lzRngr?=
 =?utf-8?B?WElUNmVvZnVrS0NrZUZUa2swK3dKckRnUzdSL29nenZPZllzWHZBT0tZWDZu?=
 =?utf-8?B?b0czQkJaYlF6ZWI4ZHA1SWd4dVM5ZWpFcHl3TzFGQ0JPMUJ6amtsdnFseW9D?=
 =?utf-8?B?ejRjVEJXVzJGTUp2QVd5UlRIY052RzZMaXVBeU9Yd2RxZ3NEcHZ3MGlBS0Jt?=
 =?utf-8?B?aEdGSi9yNm5MTHNhVlZ6K3JrOS9tenhVRzA0YUwwekNJbXZiOTUrUVREbTZT?=
 =?utf-8?B?T1JidDRVMGVBS2FYZHB4MWRFUDBFSnRzWktFN21IS28vNDB6dVBwWThBKzZD?=
 =?utf-8?B?MlVzWDZSVTFKUXRRZGlxcDc4QlNmeWJMWjZJd1NyUVhOYnBYaHV2TFBBZFdo?=
 =?utf-8?B?WW5NaWJTb2Z5ZFJvcU9CMzJ3UUh5aVZoZFltNldoZWJpbWh6SFJFVTBCcklJ?=
 =?utf-8?B?UDlsWGVsMGU0VFhIbDRnakl2bHY1N3c5QzZlbUdHbkpteEsxdENhd0Uzb2VU?=
 =?utf-8?B?a3FjRUo3NSt3UGRQRGdDeS90L2VwSjg3VTAwT0hXbHpVN1F5N3hUV3NsS0Z4?=
 =?utf-8?B?anRENlp4TWo2QnZ0UktTUjhWOFV1dHMrV2Ywd0FFUThxb3VVNkt3TG5EYTR0?=
 =?utf-8?B?c0dyY3EydzhUZ2tVeDVDemx2K1EwNGM3SFBnalljYTVONlNYSnY4TUdXQ1Ry?=
 =?utf-8?B?bk4wZmdSZDFFQi9CWng5bmRTbDJHK3lkYkd2T20rcGNQVW14U2xDOUpPekIx?=
 =?utf-8?B?L1NldEVnNkxRSUdzWDJqVlVHaW92NzEvekg2aG1GRWVhTkUwd0tWdmFkWVBT?=
 =?utf-8?B?MStzSkVlTmE5SVNFeWhCRU9BY0hkcUhBa0ExNElXQnRVcDBuNXMzalJiZ1Z0?=
 =?utf-8?B?aTdIQXhGTHFkM2tFN2llUDZHeWNKOWFuQUpZMXNmQVhSRnZsWUxWZUdiRTI5?=
 =?utf-8?B?N0RjZDc0NUl2UnNCWlNBRVhqREVvcW95MmdMc3BNbElqR3pIWFhzSGRwQVVT?=
 =?utf-8?B?VVM3b3Fpb1N1Zkp1R0VGSHBJQ1Mwc1NHN2dIYlZRdHVzUUxJRjVPL2dla2cv?=
 =?utf-8?B?UlM1OEVhU2o2MnNUdEpVUUc3MUV2NVpmYnNuRGp6dEVYckxIRVdObnN6cmhx?=
 =?utf-8?B?bVkwWEtNT2VmcWpHRUZZN1RZM2tEVmdmbmt0eHZqQk41NmxMZ3Q2RWl1QWEz?=
 =?utf-8?B?NUpWQ0FFV1QzVGVWUHhrVndTZGJHU2Y2U0M2WUljNTA5ZHArdlVCT2hWcERP?=
 =?utf-8?B?K0hIMHBPaHpSTWRZY215TzA3SXMzQUhkSXpCaENuaGxsRHhZQXgrSk1pWlB0?=
 =?utf-8?B?REhWWkNJVGVNSTFEbForejdNNDZMamJQcUNtYW9MR0dxMHVYUWxWMEQyQWx2?=
 =?utf-8?B?OHFseUxBOUlpOVFlSlRhSWlXUWUrbTF0aVBXMmFmTUwxUDNMUW14Z1ZTaTFG?=
 =?utf-8?B?ejhRTFkwTC9xRUJBOEJsMTR3WHZ1bWNzVzR6M0FyYTB0NUZ6UStDQjJqdTVk?=
 =?utf-8?B?SUJVYmtLSWFlcVZZb2w2MUdyOUo2K0VXTEJLclZYaG1oVUpGRVBEYXp0cFVz?=
 =?utf-8?B?S1J0RjV0dzRueUhSNDBHKzhNNHVvWDZxS2loRDJTSGt4QXdTTmk1SEZMdVNt?=
 =?utf-8?B?K3NPZGt6NXNMRythcnhBZkVQakpyNk9XWTZrR1UxOFM0Ky90WXFpbEk2eTlS?=
 =?utf-8?B?dmNic0pwRllTSWRBblpRR3k0a21FWXBCUWU0NFQvMU9Ia3V3M2RaNk9XT2RY?=
 =?utf-8?B?M2tMS1g2OWpGaEJKbzNJb0NVVmowY2RBTU5YYUJDSEFjTUxTV29wL21mTGJH?=
 =?utf-8?B?SFhaeFRwUWt6M0tFeWhZdVlNdHhadlpyRW5ZcVd6NjFMUDk2TlNhMVFhcDNZ?=
 =?utf-8?B?a1pMKzRvTStkSFk4ZTJOOVRlNS9Cc0FVZk10WmdSaCtyUkJuc3BwaWNJTjNS?=
 =?utf-8?B?SXB6R3lSY21FOUprTy9CZHk5RDlkOFd1b2kwMFJSdFNMcmRKN085OUhTdFhw?=
 =?utf-8?B?cHc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: cb208bc6-2f08-48d0-26e4-08dda1cab60a
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2025 11:43:36.7201
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: obuP9494/2T1Sm2qROMULKwdRlRT0pmC3SihQY7H8DO/sBJ4jhkhCjn1JsPyub8YXNuNbE83oxNGgbOQji8xoDXAbEm0Al1wLKgA3KvBna8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB10918
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 02 Jun 2025 11:43:46 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6968

Hi Robert,

On 5/31/25 8:20 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
>    Just noticed that in YP Quick Build guide, the alleged list of
> essential host packages includes "liblz4-tool". It seems that, at this
> point, that should read simply "lz4", no? At least on my 24.10 system,
> there is no liblz4-tool.
> 

According to pkgs.org, 20.04 lz4 replaces/provides liblz4-tool, same for 
22.04 and 24.04 and for some reason, liblz4-tool requires lz4 package, 
so I think it should be fine to replace it yes.

Debian seems to have the same packaging in Bookworm and Bullseye, so 
probably fine to do the change. They only  seem to be adding a changelog 
and copyright, and require lz4 package in any case.

Could you please send a patch? The file to modify is 
documentation/tools/host_packages_scripts/ubuntu_essential.sh.

Thanks!
Quentin


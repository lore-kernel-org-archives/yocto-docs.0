Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC7FC77B7F
	for <webhook@archiver.kernel.org>; Mon, 23 Jun 2025 13:18:20 +0000 (UTC)
Received: from AS8PR04CU009.outbound.protection.outlook.com (AS8PR04CU009.outbound.protection.outlook.com [52.101.70.65])
 by mx.groups.io with SMTP id smtpd.web11.19429.1750684698942614984
 for <docs@lists.yoctoproject.org>;
 Mon, 23 Jun 2025 06:18:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=GMNb5Axs;
 spf=pass (domain: cherry.de, ip: 52.101.70.65, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UCxMW3QSl1vAKogvNN7cIxLwuL+JyIhct0kEAsGsz1PPIfKhZ5CWTO9UcumzZe6QDmStAwZDhdro8xAiLDHNWVDLhVFVgdRHEY8HEHWCQZ+L+ZbbBFBr3tXWSdvJijaRE538/ihQ3Hve2LqDzYq8knY0AeR0YAOn4inTzZvsWLAW/ZXtlfvMZ2Shara7tVxgOupfyC4jPbPYpARhA4g0o8da1mgEyKeu2MKAuLlzlN3ArAi5QVti4yTd+zyczDFIKeXiQWHyvWNaYAv101E3WF+q1CJ/MNS4WJBMi+pnP+CoOd2ijqKi2phqUP/tjr5eeCL00OFfK0Bc/02xFgrORQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nfmaft+fgvfQ/Gulk9EA6SUGMRmETZZfPlgqVPg0p9s=;
 b=HlLk5caFVZW5mXB4mXHll9oItiwAzdL7lY0gJIKalrOCUiP2APjRFQZXbYKBNYTsZCUDcFOSyi9lNYS1GXRwTe96sGBhdGKMhy+zYIyu4kkp6u1slx5r5fIIHMYwY4Ux65MX625O9sqp552jS24v5IQxWV0sIku0qAweql6ksWtMcWJrOknHxw57QjT2ajtAl+n9TS537nPg2B7CEgmOVwuUSaW255fHrpHIRp1OcqYpIZ6SzrCt5Xru6xzalsnGKcSCVMbqeHiTL6ngBKnmNBvRrZZphOh2IHWe0CGBf39JAkWejNi/LJP0HMSCDTXx/hXVIhziSaX4+LK0jYvCSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nfmaft+fgvfQ/Gulk9EA6SUGMRmETZZfPlgqVPg0p9s=;
 b=GMNb5Axsw59klpHrcfu6qS0nhz0xzwtF2o7MeNXbP6C5PGIYPWwguDp9soXuVvbnPA1NJK90l3PN8R+hfNB15YzfomGWIUxdgrI62C5FIz4c5QuGoxPgwx+XxNVoMcu7pb5u8giSNFysywSaO4P/CbubCnbknMhFcEJ4U3crA0Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VE1PR04MB7294.eurprd04.prod.outlook.com (2603:10a6:800:1a3::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.29; Mon, 23 Jun
 2025 13:18:12 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::5ee:7297:93b4:a8d1%6]) with mapi id 15.20.8857.026; Mon, 23 Jun 2025
 13:18:11 +0000
Message-ID: <f096f57b-8889-4dac-8e9a-a15b04915344@cherry.de>
Date: Mon, 23 Jun 2025 15:18:11 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] dev-manual, CH 5: grammar fixes and update recipes
To: rpjday@crashcourse.ca, YP docs mailing list <docs@lists.yoctoproject.org>
References: <23ac0815-60ab-fef4-533b-920e61f5d38b@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <23ac0815-60ab-fef4-533b-920e61f5d38b@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: FR3P281CA0182.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:a4::17) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VE1PR04MB7294:EE_
X-MS-Office365-Filtering-Correlation-Id: e81be559-203e-4acf-b894-08ddb2586750
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?NWd3ZFpTTHpGRWR2cDZkT1cyZjdPSlBjS1dDNnVCK205RkphaVR5Q2tMOHA1?=
 =?utf-8?B?c0dmOGR2RTNkQXArS2JFZDZoNmt1NjFSMzNpSEJlNlNNQS9od3A0RERQMndn?=
 =?utf-8?B?YjlyNGRUalN0b3UrQXVsNGU3L2RiWnM2d1B4TUcwaERIcVgwYUlXeGk0eUl6?=
 =?utf-8?B?R0ZZYUF6UkZHS2dRNml4VDFvTjI0ZkxiU3h4OG01blJkTmhiZHVvREZLV2xj?=
 =?utf-8?B?dkVHZ1p1Sk55VGZPcWFCamJJeVlLWm5iZlFQQXgwbjYyeGJGSmpVREFRcGtp?=
 =?utf-8?B?dzArYTJhVmZyMUtUZUJUeitsa1h2TG83MlllUk8wSVVGM21NcDFOamg4OUxQ?=
 =?utf-8?B?clJlb2Z1dmhkN1ovUWN5cnVwemxjT1ZMRnJWZUlVQXV6VlFSNjdjeFgrTTZB?=
 =?utf-8?B?NDdlUlZYenNIRHNLazVpdXpmTUJqTlJIUFM3U1hGY2RwdFRyc2oxM3BRYUZE?=
 =?utf-8?B?OS9RNi8rRWhDemI1YnpmdUZHaWhOT3Q4SzNqL2hueFhxaVY0dVdaRFBNSXpG?=
 =?utf-8?B?UllWcHFXN2duNlJSangwOGpCbDExSnArSkRZSXNRaC90ckMrSlBrcURPU1FS?=
 =?utf-8?B?SmhudWFQK1krS2UzRHNVSEdFYlZUa0pBYVlsMm9wbXQrS1lwVEpkUURhV0cy?=
 =?utf-8?B?aU45Q1hPcnJ1amxYKzhuMHVpQ2wzQUxONitpcVg1RE5uS1dYVEtOYmk2ODV2?=
 =?utf-8?B?ZlRZWTBKZERsNzFQNEJPb2d4bnlWSk9teUxITXh0VzhGSXFtRzRzMW9sWjB1?=
 =?utf-8?B?a0RZaWV6Q3FXTWM1OGNnRlFZYWVNeUcwVHRsSzVsbXZ3YTRwTkE3R3grcWtW?=
 =?utf-8?B?TUZTOGtRbllRVEN2SUFQVG5zK05ycUFWcDdrbzMycE9VYzZTa0pEbFRVK3U4?=
 =?utf-8?B?Z20rY252dEpaMG9zL0lSVDlEdjBWUVh4anU5WjhvbGkvelI1NGIwY2U2ZUVk?=
 =?utf-8?B?WDBUd09SanRyVHdsN0dCcEdobFdXV0RsNVRGOG1qU3dXUXdnaERFQW85SlRk?=
 =?utf-8?B?M0VrZUd2ajRDQis4NW9Hazh0K0tkTDAwNFRlMW95dHVmQVFkQlRHbjZHcktk?=
 =?utf-8?B?bytCclA0OXpYYlNZODFRSGpYQlpIODBIakNwMjFaSTJ2dHgvWENKdUQrN0lo?=
 =?utf-8?B?dWdha05EQTd4SGlleVppOUpBZFJjci9mSWFOSlhsM2hJRFN2S3FzWVhwZjJV?=
 =?utf-8?B?RWlKS2FUOWJYMDhqbjk1WFltdmZVVDlqVVJlNEhqd1k4L1o1c3I4UWM0bk1p?=
 =?utf-8?B?K2paL2UxbG9HWDF6Ykp0MlFuaDV3L3pDc3NxMGkzNnRqTVJDK0pLNEhDSENU?=
 =?utf-8?B?VEh6aHg3UmVoWit3dFJlVE1FU21kNHR5dUY0QXdoUDlDbDI4R08zazZOd1Z2?=
 =?utf-8?B?YWN5c0wzdFZRN3VBTHgzSHM2UkI0cXZtc2s1QVdDYkxLaURONFk4c0xLdmho?=
 =?utf-8?B?cW9NYU1WbFVGMDZyOW4xOWQwbDNUa01zR0dDdzU5WUtIdWVzakhoRTl0dXJI?=
 =?utf-8?B?bmVoZ1JtVnZNQlQ5M0VvUG15eUd6Y0xnbGNsbS9JL1hFTm1yZ2J2QnoxcG5F?=
 =?utf-8?B?M0hmZFFFMGNZUkgxcm9QYUt4VEhrdGtBYnZ0Y3dBQUFBcU1SZnMwdG9Bd3U5?=
 =?utf-8?B?ZEp2Yk5NSjRnTGROeE8rU0JSUHZkb0EvMjJDTklzSUpnN0RsNTlCKzZwdFVS?=
 =?utf-8?B?QXNDcC9iOWl4RzhJME44cnBSU0krTTlhZDhxUGtBZGZHeWp0ZGEvV1B1VFJP?=
 =?utf-8?B?eFFqTDUvM0ozQkFyN3poNmptY3hwU1Fab1Nsck8zSkFkQS9JbTIwdlUxblJU?=
 =?utf-8?B?OEhsQXJnVTJVbmlBd2g2VkFTVzlYQVMzVk91MFhmV2tCK2tMQ085QmI5MWR3?=
 =?utf-8?B?TnJucG1HejlURy83OFJqU2V5aU10SWJGb2dUaEhkeElzOUJNSG94SmdIUjY3?=
 =?utf-8?Q?OoxByVTJLBI=3D?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?QmVwemkwMVVSUmNrTkhIMEQzcytzNFBRK1RxdjVlaCtwMlE5NkJIZWJ4RzE5?=
 =?utf-8?B?cEJvRVdIU25wNk9JeWhqQjIrdzB5RGk1RUNYd0d1S2xrSnRaUzA1STBCUFAz?=
 =?utf-8?B?THl6RGZ6aC82RWJIOFdleDYwdFZiL1FqM3JoalNUd0x4M2o2dXhVeWtuNWtK?=
 =?utf-8?B?RHFLQ1BDTWFFaWNzYXBkczA3N0pMTDRtYzFKdlZGdU5rSDdmdUovenhPZkYr?=
 =?utf-8?B?NjAzU2NSclBtVm9Cb21ScE9uRzlUWEt5R09JUUJYU2grZG50Q2RzZm94c2Mx?=
 =?utf-8?B?azkySmdQRElRWXlLRzc0aW9oUE9uYi9sQmxDbWhrR1N3a29xS3ZTa05mK3lQ?=
 =?utf-8?B?cVBhMzZVdTAyNzlzcTl2R2ZVUTBoMGI4ZlYwaEtqQ2J3UGdwN2pEdElCbGUv?=
 =?utf-8?B?bDlORVFPd0ZyYTN0d1hrVDg0bTdNY0pQVnRNeTFBVEw5UHBaa3F6MkNZUEx4?=
 =?utf-8?B?RWRFdTdNSlhIUkRtU1RhNk1NWG9RK2tKU0hVTVovNklMb2tTZ0J3S1BmVEp3?=
 =?utf-8?B?d0Rkb2dHRzQ4Vm94YWEvUWVGR3kwVGpya3FqTWd1TmhrY3UwalQ0c2ttb3Vu?=
 =?utf-8?B?K1Azdk8vbHQxRElOcy9qZ01VS2hxNHpmY3grOGV5SlM0VTlzRExrY1Q4NkIz?=
 =?utf-8?B?ck1pb2p4YUtTanFMMEpwSURkaU1NVDEra0hsb0lKSVUrVEhndUgyZFFZMlNa?=
 =?utf-8?B?NnZIZCtTY0RHWURWdVdSeWVZcjNXcjR6K1QyeCtpUCtGL0QwaGxxdEt0TGY1?=
 =?utf-8?B?aDJBbm5WUDZkVFNiSnUvOFFYakRBeFh0eTZuRTU5TXk0c3BSdnJuTkp6a2po?=
 =?utf-8?B?Q3l2YWNUWlBLd1lRV2tmVnE2WGxsb1daQjZIVHNkZTVPVHpJRHg0SitOSDJk?=
 =?utf-8?B?MnJwRFFXOHROVUI0MU9IdE5RRGtVUXZuWWt5bDBIaVFCRTIrUGxSYmtydENv?=
 =?utf-8?B?elM1aTRkVCs4Yyt5ei9RSyt5alp0Q3dCRmp2ZDZLTmFtQjlwNzdJamtISmp2?=
 =?utf-8?B?SStoNmZFbmYwMVJxUFhQT0p3REhWOGVNTDVPdlZIOWJBUXpCTXIyY0NZZnlC?=
 =?utf-8?B?TUVKcVBwd2RpQjFFZ0x1ME82bDRWcVRBcHpmd2tvcGtvQzRhQUQ5RWlmVVor?=
 =?utf-8?B?MVBFWWllTDRQSFFIZlMzUGNFdEtQREVaaDdoUTUyRWV4bzE3aDNhTm9HZExB?=
 =?utf-8?B?KytVd1N0M2IwR3FRYzZZU1N1T2ZpY3V5U0tYRktwQ1RILzNabFBFRWFnUFlp?=
 =?utf-8?B?K1dvUHFTSlBVMURreExOaFVaQWVOcU9aTEQwaE51eG5iVk4zQmFLS2lqTTFJ?=
 =?utf-8?B?OGNlY3FjUXlrN01qanUyWWpOZTYxeGZac3lSUEFOM2ZZT2pzVWcxWklDMGhr?=
 =?utf-8?B?T0tKZE1vZ1JEem9MUzBYRFFuV1lIUzdTbnAyNHVpTnpydUpSbHdvQUZQSFBJ?=
 =?utf-8?B?TFZoOWdDLzVnUlFhY0gzYXFTcDFHZExlOXM0aHQ3MlpONlZsU0dEaDJyWE1q?=
 =?utf-8?B?aEVVcXBzdjArejlCemIzTVh0YU9GbWdCU1hZbHlPWkJNRFN6VUJ2K2w1TDZy?=
 =?utf-8?B?TlJ5cW9CejZKd1lRdjJINXRSUFpSY3FmNHhkbVFkbWRyQzNVQTZMVUtTTVh6?=
 =?utf-8?B?c3NEbFBNemVIVEx1aCtvYkY0S3dBZktyMVN5ZTVwRGhmRHNkdUdTV1FWZmwr?=
 =?utf-8?B?ckhzU3RwQUEzYWJ6UUQ1eWhGWWRHV1czMTdMVlA1QS9MRklGR2FkS1pUUkZ4?=
 =?utf-8?B?dnNvSStydXlsK1Y4R2pmVEJvU0xjVkJ2eUNCUk1ZdUhqM2EvNWIrRXpRMXNH?=
 =?utf-8?B?MXVpSHRjL1lncXpxRGRtNGdIT21yUWVudVUxK1krZUFON1d1aFYwK2VuUkxH?=
 =?utf-8?B?eGxtNlVSNWdzZ2NoNkZSUlRWZVBza2NRT3gxSk9jbGVNVktQTFE3ajJzWWdR?=
 =?utf-8?B?RmxXK09ENXQvaFp3WWZIUzh4TkhiajJvUXFzTElGSDJMWHlEMVlSNUFlNnUr?=
 =?utf-8?B?RnFKTnRqcUplMkhmWTlBOGh4V1R6eHhCbWxYdUtqTFlPS2QrQjE5SVd4TjRi?=
 =?utf-8?B?d05QSEZYdlBFRTVUdHZGdE5VK2lvaUtPNmQrK0M3TFZBa21NakNsSU5xVGFO?=
 =?utf-8?B?R05BR3JONSt6U0xodnE3czhMRU9MWHRJdis4b2FtT3RFWEtZTk16OEVSelpm?=
 =?utf-8?B?dXc9PQ==?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e81be559-203e-4acf-b894-08ddb2586750
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 13:18:11.9283
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0ttlCc6P6pXNepwNIR7M7iTEw7+08aZL9DzNxUW7ZGMcBuVDCCv8nYBKs4MPRtSzsupmJxKszAs3gWy1/SSAmNz1bagkEbuDmkElGNrVOP8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VE1PR04MB7294
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 23 Jun 2025 13:18:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/7151

Hi Robert,

On 6/20/25 9:09 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> 
> Major updates:
> 
>    - update strace recipe version
>    - replace git example with gnuplot, which actually has two
>      SRC_URI values that need naming

But is part of meta-openembedded. Can we use an example from oe-core maybe?

Looks ok to me otherwise,
Thanks!
Quentin


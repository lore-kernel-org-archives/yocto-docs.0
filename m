Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0FB9D44C79
	for <webhook@archiver.kernel.org>; Thu, 15 Jan 2026 16:17:54 +0000 (UTC)
Received: from DB3PR0202CU003.outbound.protection.outlook.com (DB3PR0202CU003.outbound.protection.outlook.com [52.101.84.69])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.39743.1768493866115526449
 for <docs@lists.yoctoproject.org>;
 Thu, 15 Jan 2026 08:17:46 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=hMo3/miU;
 spf=pass (domain: cherry.de, ip: 52.101.84.69, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LUUh8NyDZerXoX+7ocWSVmWeFanqhGVdQKuWIJS6JYRnBnsJSEgWqMKOZbxXcHcZfPmJ4U6PWSWapI1XUPJvTdvwBa+5DQfKbH95aL/aH0tM0FoX8leHejqglD28z66sIPu9/leGaVprq7QAQ8OGm3nzvt50eqei6TsPL8djKOsWqaJVA98CyIKy3O4ZRmye20V3fOAmne54JiZKrEV2Y2HwDanUFdBWsVqzoKr7YECt38AwVn+6QcKwE9WFPwcWGTHsT/Ja0BU4r/QDsBA+0/xnU6QQKwRG/ndow/zG1Lu/IuJPRnmbcu4DQRpxlZDIniJM26mUEOYJ19E5yMyQWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvsKogJWy/ESk91XAkg/7brfJlRIciIFtNQfJrdvdCE=;
 b=uplcDpEmMmuC22C94DkQUSDhzlEpb9FU4AaFII4kSP5wBaVEQwP+ZFfGAtKTHTrvfPLDxY9cxmtDhIq/EFPTaUEQC6m6kmjOsekQcAs8TIAQax9eYAt74IT6jOoOna7rnOPZ7T5v9xKg5pOzXC3rxdcKzDLysBPzO98tRTD8lbCjfVD4f2eq800s0tPD9GxWjNB2fKc3vu781ckiEsuz4HVjlE/waOrn0xhWtqYYTenzjFuypFWrg/d6vGKDhvO2sf9dcNfGM3Nbyty8FOPlJEjJfvhldDmWgs8KnI4BDmk1Xx1pzVkgucM6rlgADgJD6qQGWvvZ+Rdq3EThyWUZ9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvsKogJWy/ESk91XAkg/7brfJlRIciIFtNQfJrdvdCE=;
 b=hMo3/miUqwjUgWhwf0q7+gdDDN7uWYIKc/bQoy0FQWmUlm52ZqaqZtJZbLPjK8wTbs6us4wIqLOWWwi/Orwib057+cJivwVYZyxi5JUhiSez6aAXKG7O9f/yll2nnWUhJXOPVnYh6hUqIlwUvr96Mf8RlqHHGt+HkPw6Q2AmXVE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by AS8PR04MB7494.eurprd04.prod.outlook.com (2603:10a6:20b:23f::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Thu, 15 Jan
 2026 16:17:42 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%6]) with mapi id 15.20.9520.005; Thu, 15 Jan 2026
 16:17:42 +0000
Message-ID: <4bcdc409-cbc5-4cc6-855f-42b48a0766df@cherry.de>
Date: Thu, 15 Jan 2026 17:17:37 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] is there any way to render content in italics in a code
 block?
To: rpjday@crashcourse.ca
Cc: YP docs mailing list <docs@lists.yoctoproject.org>
References: <5eef4c2b-95ae-cc22-b44c-a03e29982c79@crashcourse.ca>
 <78dfab73-8d58-4cbd-b452-d34c1cc14ae4@cherry.de>
 <38b9c8b4-84d7-ad15-5bcd-ca16d06b5c20@crashcourse.ca>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <38b9c8b4-84d7-ad15-5bcd-ca16d06b5c20@crashcourse.ca>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: FR4P281CA0107.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:bb::19) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|AS8PR04MB7494:EE_
X-MS-Office365-Filtering-Correlation-Id: 32609bad-57f8-41b7-3d0e-08de54519c16
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?aUJNa09FN3FjKzR5SjliUzgwWkJFYVZ5RmF2dmVhN1RHdmhtZHZqbUxmaFJ5?=
 =?utf-8?B?VXVaN2tDL01zdnF0ckg5eEdWN09WaGhjMVhocHlYUkd4dDNBNXJWbmVKdW9V?=
 =?utf-8?B?QndNMVVmVE4zcTYrRFpaK1dET3lpMzlaYzdiYVFPSEUwU2tqU09ESkpTN1dZ?=
 =?utf-8?B?YUJuZ3JVdE9kVXhmeUxvZUNBanl4VTlYSWN2b2s3cDlXc09aK0twSFBkK0hE?=
 =?utf-8?B?WWNCQ21tZXNyUmhwRzBITk1aMG81K1hEWGU4ak9zTzE2dUxqS0Y1UWJsYk9C?=
 =?utf-8?B?ZU1JYnJqMW5uOTd1eCtsZGtRYjYySTFCeEtEcUtGVGVyM2RndzhMTzZPZUNy?=
 =?utf-8?B?S0lZakx5ZFBsbkNlWWZUcUNiSjFucHRiOVFDa0JKaVRjMExuN2daamRxUWxi?=
 =?utf-8?B?cUEvbWpxODl5bmlKMFE3VFNScWJlNGE1Z01rRmVYbThtd2h5YVQvRXI3bEI2?=
 =?utf-8?B?eGJvUUxRK0h3RHZveHNFK1l5aEhIRDd3dTk2SHRja3o4Uk8vanJTM0tYdDdX?=
 =?utf-8?B?Z25BNWZVMEhEUWJWdnFVRVRhQkx5b0VOYTErcEhOdzNhVENEaWhFM1loM2RH?=
 =?utf-8?B?TUFHdUtYQjMzdDZQUjAzdVUzTUM5ZlB2MTV4MU9wWEk1bHBXaHAwL3E1SHR2?=
 =?utf-8?B?bUp1Zndoelh6M1MybVZmT0NqaGJBK2RZZjM5ZXhld3dURmxSeFBXMWNic0wz?=
 =?utf-8?B?VENCeW9LQVhabFhBZlBuanNrNEJGOTdzZytzeVJnczl5QTRhOW5Mdms1cDVn?=
 =?utf-8?B?ZzFyN3Q1bGNXMzZSWW1BTXd2a0xVaVFOT1doNmVyMHY2dzVtR3NKaTA2czlZ?=
 =?utf-8?B?K0o3QUhEK2pSSk9yZlA3K2MrZ1BSNjJVUHJQdk5QYllpQlRUdWVZYXBvR0RM?=
 =?utf-8?B?cVRXSGxQTXdSK3RyVVA2QjI2SXZuQVd0ZGpUaWxEaEdTNnJJdTRmY2RpS1o2?=
 =?utf-8?B?bGFmU2RHRUo2eGxwUi8zdHU1cjEzd2VwQkhuTVhjN3YzQzdlSUx0RE40WTdv?=
 =?utf-8?B?UVJQNEFFZm5naVVGdUFyOVZ5KzNmUDVKSEZUYVRlSVIxcjZnRHM4RGlZSlN5?=
 =?utf-8?B?SnVXTWJDSVd2aUZ1cVNNTnRvLzhtVTVlSUNEQ1p5L3VDVlhhSThQaDFVWi9o?=
 =?utf-8?B?VGNzdUxhSnVHL1lZeEMvYW1qcU5KN0w2QnlEUEJVdVozSlhYV1p0WTg0Wjg0?=
 =?utf-8?B?RnVUTTJnQjdWQzFqMXJiajRRTTZUZm9iZ2NieEl6RUs3UzBnSEo5aVNhRHhk?=
 =?utf-8?B?WklzczdlNFNkZGRSNFNxenh3c24rMTdoS3ZNb2gycEMrejVXUTE3VDVPUVJW?=
 =?utf-8?B?Tld4VzNVWTc1ZER1NXdSZmNvc0lIcndyb0ZVTVV5L0p6R3IwclRCeVZEYlhw?=
 =?utf-8?B?dDJrR01Wa1QxY1RlY0V0Y0loZVVKYWw3ZzlGNGJRMEYxSVBKS2VNNVRSeGk3?=
 =?utf-8?B?Z2NDeFFYNWhpeERpbXZUK3hrRTRhRk0vc2dvUVdCNERNblpkOUhyVWZQYXdq?=
 =?utf-8?B?RWVyN1Q5dWhjOTZxNkFSUnNRZ0xTSXloQlNTZUtwWHUrRDJseksrVUFaUjFv?=
 =?utf-8?B?aXJpMWx1ek9EOG96ZCt0dDhMeGxyOWdoR3JmM3d4bzE3dWxrSXdjQ2NxYkww?=
 =?utf-8?B?bFlxWnozK2s0L0tZL0hqV3AyL09xcTdIbXBoNVpxYXZIZDh4cm53SS9tVHFq?=
 =?utf-8?B?QnNzZWNSUytMVXpjaTJ1OTluSUpqeEJPTnFiRXYwWmdiOU5lT2RhbVJ4Mk96?=
 =?utf-8?B?SjFvTlZNcDJtMDh2ZkFvQUJBOVMxU3plQ0s3U3ZNc3R0RzE1dTdaalNnWFl3?=
 =?utf-8?B?Q0ZVdEJhN01YaUJ1V0FaZlF6aUkzOFJtdjN2clk0QWxoUkp5QUFlNDVnNXJi?=
 =?utf-8?B?N0EwbDZtb29DMkZFRFljcW9kQVZXaTdFNEIzOTd2S0FjaDBnckFJdWdRL0pz?=
 =?utf-8?B?RDRkRXhqT2hacVIwamRhWGlMcGxmK0hUR3pyNnFTLzlna0E4L1B2dy8xcUxW?=
 =?utf-8?B?V3dGMll1aW5iNFFFQW1vT3BVNTVOdFdOd0plV0xYRDJzZS9ScG9oUE8wYjFS?=
 =?utf-8?Q?HKVnOB?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?VkZCYWdQem5Tc2cyd1h6OE5wMW5HcytpNUZJcUNEVTBHT2hlcVhKSWJ2SXNS?=
 =?utf-8?B?bVR1QUtkNUEwODBka3QyeXVXM2pTaTRkOTdSUEp4T2s1NFUrb3lKZ3AwM1l6?=
 =?utf-8?B?WDgwazdFbGcyTWFZc1JtaTBBNWc4L0IzdVFhR3dobHVoTHZ1Qnc2Sm1kU2V3?=
 =?utf-8?B?VUlpQUhwd0J6K1AzZC9mbDgxU21mZFA3QXBCTW51WFR4TzVvUHBsbVQ5ZGFl?=
 =?utf-8?B?cnBHY3FsUDFKU2NTSmJkaGJRc0R5bkh5VUVTWGtUajl0czU3WHVTNkJJcTNs?=
 =?utf-8?B?aTQzU0lNY2RFRDVydWEvSGRoSExkeExRY0pKdHRyVllPdVlPU1kxNFpYVTgz?=
 =?utf-8?B?TE5PakpEdUZmbVM2RC9vNCt6RG9TSy9zREFrbm1ZQkd2elNzK2h1MzZxZnF6?=
 =?utf-8?B?U3MrZ2dsMlQrMzJTTFRHVW5ueEdhR2NFT3NnejJRclFDZ0M1WHdEWU1IWmdW?=
 =?utf-8?B?Q1VlTGtFOHJZOWIzeWxOSm1xM3RTeXZYNUJsZkdiNHFZeTdQNXVoK3lSKzRn?=
 =?utf-8?B?UW1hSjdQM3pSM0xETXhKdTBpWDVPQWh3cE5pL2pyZkw1V3NZT0RQZ1gvYjlm?=
 =?utf-8?B?S09KVjlyN0FOakdGalhpazUyU0F3MmRtdnpEYm1ObFJHZGxON1ArcTE3MjNv?=
 =?utf-8?B?TXJqbktmWDhtOVh1dm1Ja1NPeFJEeGM5bVYwYjV1Wk1iaWp0YmkrbmR1L04y?=
 =?utf-8?B?NmN5TGNrcS9aSHFIc2xkRDNkdStEMm1hM1hKY1pjMjFvV0xlckZocG5EclFu?=
 =?utf-8?B?amxTZDByU2NOakNGUGZGbVZOK3NhYzB6WGZWbmpnY0dXV3RWaGYxQ3duaE1v?=
 =?utf-8?B?b0RCSU16ejlYVFNiZUptam5VZUZITEZjd05rMmQwOEEra21wU3RLSWVyZEMz?=
 =?utf-8?B?ZVB6c0tUY0xveEZnSnNQRkhGQmxhVWVOczJQRmNtQyswczBRczlwSktkeXhj?=
 =?utf-8?B?aEl3eUszTXdGOUorOWJCbmYxaStEU1ZRNXBvTUNGTXNnMm5nclFlN1ladkR5?=
 =?utf-8?B?TytwUzJFeXdNNUptVFY2ZTJQc1BJcjFCQmRpcEgvbFdCVEpvOU9SdkdpblQ1?=
 =?utf-8?B?S3laMmIzOGNKZ21adXQzTjhFbm5jbTRiMDFpRUVTZ01YeTc0a3JZU3JwNlZr?=
 =?utf-8?B?Yzl0RVY2UmloU0kwNkZvWlQrNUR0eUhrVWhMSlNtMEJwckRtNFlwS2RyY0di?=
 =?utf-8?B?dk50STJFNHh2NkE4Vzk3clljMlRvVlh6UXNCelNpTVZHaGJkL3VUek90c0tp?=
 =?utf-8?B?OFk0SWVmMy9NeWo2RkkxNmxveEVpdkpvRE5WTVU5a3dXUFY4Nm5kZW9za2Jv?=
 =?utf-8?B?My9qZkJQZkJiRHBpY1hBYkJSZ0t2ekRMd3pMaWlKRXVlRGRnT2tMUEIyalFp?=
 =?utf-8?B?Wmt1U21DeGhaUnZBSjN6VCtQVmVwNk5rU1Bmc1lJWkpPYnBndkgreGtQRXFT?=
 =?utf-8?B?YlN4ZHpEeUd5M0JkZnRhSExYcnBmYUJPREZFeFlQQ1RlMXpFUXlRN2RkYjJS?=
 =?utf-8?B?cXdXWXd1MXNhQnhySkd5dm1DL050OXNiVmxkNVB1RHE5TXE0UUtEUEFSNGF4?=
 =?utf-8?B?dTMwTWlER0ZMeUs0T3JSUHk5MzVacDVwcXFPajM3Ry9oYStSUk0yM1YrR0hz?=
 =?utf-8?B?RTc4UXRoTnlQMWpxYnRSLzFMZ1hIUHNIdDkyR2tjM0JyeFlTUG5oa3pqUDY5?=
 =?utf-8?B?TDZZaE5mWG55Z2dMQW9udTRqNXh4a2JqbDNEMXJkM2cxTGU2a0R3NXYzRng5?=
 =?utf-8?B?bmRrSTlxdzhyZXc5UnhIb2ozdnZjMUpHZmYycXNIam5uZVNvVTdXc1UxQkVZ?=
 =?utf-8?B?cXBrc293cXRCWWEzcjRVZmc1aTZrbk9mNndyd3ptVEU4enFnYWo5THhLWlZD?=
 =?utf-8?B?dFlmeklSTzFlK2loejVyWU9odk41Ky9LNmdWVy9vZjNtTnZKV2l6T1ZRWGlQ?=
 =?utf-8?B?VmxOVFFPMXJlRU56Yi8rV0ttU21LaTZCeWFJd3lwcHc5aU5JakdPMHJzZzJ5?=
 =?utf-8?B?ODBOTWdlc2VwU3REbUNwOEtPZU44QWxSY2hsWmlWZ0RIT2FnRVlLbGJjTS9F?=
 =?utf-8?B?QUQ4Qi9aRGZmaVU1K0ptUWE3a0RhZGQ3anJzTmZkU0ZGL1pnSlc1RS9pZEdE?=
 =?utf-8?B?NkV2QnZUdVNXdEQ5SGVvcFpqejFRR3dPcU95QW1wZEtBMW5JMmJUOFBqWmRW?=
 =?utf-8?B?Wnd5Y0NjTW1icVFDb0hoYlgvaXJGbWZlbU5ETUI0emhOd2tXUUVrY0hDM1pr?=
 =?utf-8?B?Rlh5RGpSdmI1elNKUVFiZ09xazFDNysxdFFISWJCaU8yU3F3MGdza3A0L2Y1?=
 =?utf-8?B?VTRaYnJYTnpYWEhCbGZaajlrTW1uMmhTa3V5L0FiT0pyUE1ra3kyQT09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 32609bad-57f8-41b7-3d0e-08de54519c16
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jan 2026 16:17:42.2492
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NxhnZQ4RqnGqNAqREbF3fnJKh/XSv8p55oxcz3IlZ/PLkkp6Yf30fwljumGeEEHcRprGf8ZsLqZJvpU2iTrS7+n6IRKHRW/5z2QTaH2hHNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR04MB7494
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Thu, 15 Jan 2026 16:17:54 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8577

Hi Robert,

On 1/15/26 4:55 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
> On Thu, 15 Jan 2026, Quentin Schulz wrote:
> 
>> Hi Robert,
>>
>> On 1/8/26 10:33 PM, Robert P. J. Day via lists.yoctoproject.org wrote:
>>>
>>>     one aspect of sphinx that gripes my wagger is that there does not
>>> seem to be any easy way to tag something in italics in a code block.
>>>
>>> here:
>>>
>>> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-manual-execution.html
>>>
>>> the code line:
>>>
>>>    $ bitbake target
>>>
>>> really needs the word "target" in italics to show that it's meant to
>>> be replaced. and, no, this isn't minor nitpicking -- the whole section
>>> on overrides desperately needs to be able to show what things a
>>> developer is meant to replace.
>>>
>>>     is there any way to do this?
>>>
>>
>> Not that I know of.
>>
>> Another option is to follow conventions from manpages for example or something
>> people are most familiar with.
>>
>> bitbake [target]...
>>
>> maybe? I'm not versed in manpages.
>>
>> Also, you can simply specify after the code-block what must be changed by the
>> user. It doesn't *have* to be a technical solution.
>>
>> code-blocks have :emphasize-lines: maybe there's room for adding
>> emphasize-columns or something like that such that we can specify what to
>> highlight in a line.
> 
>    there is (sort of) a way to do this, it's with a "parsed-literal"
> block, not a "code-block"
> 
> .. parsed-literal::
>     ... stuff ...
> 

This could be an option but only for BitBake snippets where we cannot 
have syntax highlighting anyway.

I *guess* we could afford this for shell/console snippets too, provided 
there's no console output. How does this work with the copybutton if we 
have a prompt in a parsed-literal? Maybe we'll need to get rid of 
prompts as well.

Also, maybe we want to have a look at how sphinxawesome-theme 
implemented emphasize-text for code-blocks, maybe something we can 
implement on our side as well (and have multiple entries for 
emphasize-text?). (MIT licensed, don't know if it's compatible with what 
we have in yocto-docs). c.f. 
https://sphinxawesome.xyz/demo/code-blocks/#highlight-placeholders-in-code-blocks

Cheers,
Quentin


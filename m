Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2A8DFD7F9B
	for <webhook@archiver.kernel.org>; Fri, 27 Feb 2026 11:50:21 +0000 (UTC)
Received: from OSPPR02CU001.outbound.protection.outlook.com (OSPPR02CU001.outbound.protection.outlook.com [40.107.159.57])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.93911.1772193010922090988
 for <docs@lists.yoctoproject.org>;
 Fri, 27 Feb 2026 03:50:12 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@cherry.de header.s=selector1 header.b=kW0rdbO/;
 spf=pass (domain: cherry.de, ip: 40.107.159.57, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s5nOxjJET21EiRPzxf2EdRRnxFh3kI5KzPr2e8adowb7W/ER/bKjDQdB1QtBbyZYEeMPfhzbrt+xHaR6q9h/DxwBKvUZqMRZSiCumrDCffvhIHoHtjzTHWZrz/busFQ0diHoloKpsndzc6DJ8WVAZUFDHUbINjykeMeeTfRPmkcg62Hn1PldgfKn4XhsyXFlrKt8alFAq6pfblddUwXdjIOMs3sD+onNdaKj2fSMjRrpEgToL7dlXECUQ+Kb7rcs6xhE/bJx8jH16jH7B2EC0ZTgJMBzfAJCI/8h1Jme5q7xnQvGXMnldiANO8Jt6nOVTcKTL1mVC6bZ8oGyaU15Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HhDW42KdfSmWOdy/cJ5QQUndIgqx1bTRAfQAo1OcTds=;
 b=l7O4y38tMtC/nlSc4J0DwhihOftFpmeoXHtsqcT+zuE+Teg1i1yBldyW2zWY8V4EdWq500TvUXf3L6LNqPh7uhe6kvRRksbLl/a3kO4a/ePHrsQr5AOEh5KznrRbl0CCssFo0UtqC05tGm5PDzm+9EK3yfqrT36KLk8QP5KSatnif/r+fvDljOg2MB5mXRgNaYdHpLnT2oQftyX0Z2S5x2JYw07JX826TApzzQ7IIZhMlNbysrZnKrhRTHUzNLTqMMu8FfdWr8BIO8iHxA6HLjQMHWdD0W0od/ntpSJ4BugThOCT1aLeUt4RnwoNwKJk1ve3nO/vIk7Iy/zFWjOBPA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HhDW42KdfSmWOdy/cJ5QQUndIgqx1bTRAfQAo1OcTds=;
 b=kW0rdbO/hbtQ8xXxnKa2yEgFyuitKn5R8IMTrbcgUzxSI3fHDR9j5RFaJjKytXwbCGGSYwwjeoLfBinTQOW0bXSbISgJGt99pxZRPghIMCMRo5ZiYjCyeeCSQZEiIVoW0ga+j54ba7i2Fg939K3lNU7t1wZD5Rf3VrtmLLZ7nZ4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com (2603:10a6:150:2be::5)
 by GVXPR04MB10024.eurprd04.prod.outlook.com (2603:10a6:150:117::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.13; Fri, 27 Feb
 2026 11:50:04 +0000
Received: from GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78]) by GVXPR04MB12038.eurprd04.prod.outlook.com
 ([fe80::6c04:8947:f2f0:5e78%5]) with mapi id 15.20.9654.013; Fri, 27 Feb 2026
 11:50:04 +0000
Message-ID: <c1ed8625-0753-46f3-a790-dcfec7aab9f4@cherry.de>
Date: Fri, 27 Feb 2026 12:50:00 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] Links within 'Mega' Manual?
To: antonin.godard@bootlin.com, Daniel Ammann <daniel.ammann@bytesatwork.ch>,
 docs@lists.yoctoproject.org
References: <d8d48a98-edb6-4e30-a49b-0a9b52b14216@bytesatwork.ch>
 <DGH5FOYF4KTK.1VK3DQX1ESCRO@bootlin.com>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <DGH5FOYF4KTK.1VK3DQX1ESCRO@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
X-ClientProxiedBy: VI1PR07CA0243.eurprd07.prod.outlook.com
 (2603:10a6:802:58::46) To GVXPR04MB12038.eurprd04.prod.outlook.com
 (2603:10a6:150:2be::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GVXPR04MB12038:EE_|GVXPR04MB10024:EE_
X-MS-Office365-Filtering-Correlation-Id: d40e9f1d-5f06-4d58-57ad-08de75f658b2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|13003099007;
X-Microsoft-Antispam-Message-Info: 
	0bfPFpJ7LI0H37TmLaNf0soWxPy4zZiRvXFHOkSaw8VzsJi7rhkK461MvFBco2NnrNFCinfGdvT72Wwe4cqoNvxJW6U7utvc/AFxhg3+GefOhwjHizA8GdgE9svLEofrNgYcjGU5r2A2CSUbQbx5ud+9qWgt4B+qNEAfGW+Mj6yeSZGUucVEQwBPGzdxL38EMje/bqX52MuqDafprDPFTaNoVqN0890Ymu6K4Fit5XnagfmC8OO8VfrPE0yTdoC9heSd0BEMrFJA8QxUaIs/u5vtVy+orQhos9xt2438ZM5CW2HcrEfeLNylC7cWWUK6eekjSvmLrs0KHixYZt36yZHnzNxpxiKqZZ4ye972rYSpsIgqhCEEz0p9ZEMF6uedBStlc44Pe5PrKS5YIxZVhW9InUfZGDBlucacU+cLpj+OgwarUI066+jrvq4K495U8dIRV+ofPKYdJwvZytsZuj2e8H5tlyZFqDLryOzZu5mrWOOtd0mgYNIELgOpxKAJGQB7kH5NRiKmbN3bZJe3thVGVHQx1z9XmE3qpI3cTQ1fEUT2PMJWOuI17gl5yMP6kkKJ/jN9COQTEFxXcR7IO9KOPuawcsAKgNKTlw0NkO4a7xMNFWzxnit6rGA6xPTSjBOFGZM6GRQBUYOieDsvy4KLmwJeITEAlFbdl00m58/4RzNP7eDSO2IEXo1Poks3
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GVXPR04MB12038.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?bnNiR1R5ZytFOEtnTXpoMmgxYWgwWGpWTCtwY2N0WDdhK3lWZ1NiczQ2UW1p?=
 =?utf-8?B?MHFRMFdaclNPbmg4anNNdnFRalN4ZVA1cEI1ak5la2lBd2FQbGFCclpFZE91?=
 =?utf-8?B?blBLNFdVYWF3bEJuSlJ3M1dZZlBONDJwbjlFeDIvZXdBdTBzaW5jWXU5Zk1Y?=
 =?utf-8?B?NHVqbE8yZHpLaHhUVk1UelFVNjNnNkdlcFlaNDhqb211T21YcnIzVUhPWStO?=
 =?utf-8?B?QzYrY0hGN1ZJUzcySitON2RqY2ZUeE1EM3o1WEw4dHI5UnUwRWdIeVdIcWxi?=
 =?utf-8?B?Z0pERWNKUVN1MlhTK2x1WlMxVXZXL2lWRjIwRFFhV0ZURHZsaXo4UGVpYzZY?=
 =?utf-8?B?WE01VVNUckZGWkQybFZLUis1dGlJeUZmY2lJbEJVaSsyNmduV1NsdHlCT016?=
 =?utf-8?B?Uy9FSFovcXd1WDhJTVFYK1BWOHJLWitBaVB1U25sODJCajhDRklxNmhHcUtw?=
 =?utf-8?B?dVJ0Q3pBMHdpMno5c2hmeTZKekFRRnJkcVErbFRvU21vNHBycG9pTmhwUGZF?=
 =?utf-8?B?MzNxM3NPbHpQYjRnR1JZdFZXdS8vdXdzTDRhcUpFaUF5eTNhZERxSkd6VXI4?=
 =?utf-8?B?QjFEeGg5NXdXZ0pqZ2tqMUFiTnZhWVlPbXRmckRldDVGMTBVLytXRVd0a0Uy?=
 =?utf-8?B?WjJWbVNKcjgzOVRWczdEb0lQelhtaXRXKzVpNUtYV04ySUdUb0J1d2JCNlhD?=
 =?utf-8?B?U2lHOTJ0UXRLampEQ1NncmxUbmFRNStXeDNTalRPQzFVNisxSURWZkJ4NEhx?=
 =?utf-8?B?L3NKTnNWYlBWRW4rVEhXMmo3bGYvaGZjVGdVTlBLTHNqSUtZNUJDNWppV1lB?=
 =?utf-8?B?dEZIdW9mSVFpRkVudmFPRk04OVMvaU1wYXFrdUY2NXdseUEzM3BYc3F6eTZS?=
 =?utf-8?B?TDJyaXZnU0dXN3h1MndZb284MkI3b1IrZnNua0JnS0tHTnZVak5HYnJEQ2Mx?=
 =?utf-8?B?ZXpsei9qN2JPWWJxc3c5dU1yODR3SWorNzZGZ3pUNjRWUk9GSTNQYzNENHBa?=
 =?utf-8?B?MlJSc1ZtYUdFcW9UcThjLzBKYnFCZkM4dEtSV0VCVG5VbzFzbGUyOGxNSGgz?=
 =?utf-8?B?djE5blRrMjNQRXdNTmVMTGdxS3RMYllKWHB4MWFhOVpmRENVRmFUY1ZBRW4w?=
 =?utf-8?B?NTNXWG9zYWo1M3QzelovdUZOTktGSXBHSVN6SzJkOXZ0WHo4bjJZSUMrWjAw?=
 =?utf-8?B?OXdldGdRaXdkaDliRjZROTBGK2xDTFl3N0hwbTI5NmNSeVNWb3BrTkFpZDJT?=
 =?utf-8?B?QUhzbXVBUS92d3l4NzRaWmc3WkM2ZnNIV0sxeXhFUkZVNVR6T1dzS2xqRFor?=
 =?utf-8?B?WmdZY0R5ekp1ZVF5NzRNdmZyWjE5aWZFS2d6bkltYWdyb2ZwOVUwQUxwY2JU?=
 =?utf-8?B?dkl4Wm03RWFZazF1dzBsYUFyMjlsRjRaaEYzcGd3Tlp1cVVCVHdnU3pnbWdm?=
 =?utf-8?B?Q0h1ekQvb1Y5KzJLbHY2SXI0emFsNjMvZEJUSlNvdm9WVnA1ZW5lOTZJd3Nn?=
 =?utf-8?B?YzlSVDkrYys5M29PVlhDL1ZXejVWd2xBTE9xQ0xhQ3J1Z3pDbGw1a1ZxLzZx?=
 =?utf-8?B?N0xQeVJvWE5Ub2EyOGlCRm5NODhNUXFSR3NIYjYwYUZSZmI3WFo4aEl0bFgw?=
 =?utf-8?B?UDNTbFdna2kzcVgzQkwwYnIxU0xOcU1jM1VDTGJHTDh2cEZkN0lRRHozaDN1?=
 =?utf-8?B?ZTRKTVVaK09vV1lEYzB6MmtKblFkbmYwMnNHWjg3NHRkMDlldU5JZFh4ZGZU?=
 =?utf-8?B?TXU0Yy9EMmJrTjYweDZBczdST3MzQVhGdlE1SDV3YnpYTG4wUHQ5Vk51bEd1?=
 =?utf-8?B?OXI0YlRDRGpxa3J2K1REYm8yc0lHRk1ZNjdkZkR5b09tYi9vR1N0bnlGdjVz?=
 =?utf-8?B?dmx2RzFxRzlveHRibjdZeFY4cWV0VTVFTXlHY2JiUW91VWVwS3Q2N3ZSZ0or?=
 =?utf-8?B?YkdWWVA5TjNDZC94SHM3NmxjWC9aZjJUYXlVbmc5aE5xUDRvODhuUWhVbnVu?=
 =?utf-8?B?QUU2NnlJQ2lFU0RvTnY4K242eko1TE1NMjRUd2czNVZHcng5U2xWMWtCQXZo?=
 =?utf-8?B?aU9RMm9ES3BUVFVFdmt3NllHb0ViZzd4V200elEwb3lBYWtkby85aVlRNHUz?=
 =?utf-8?B?VUVpR0J6NXV3U2grY01qSkxJZUdYdkN1R3lTVnhFbC9mcUkwdE9WaVJVcXQ1?=
 =?utf-8?B?RU5uZ0xxL0huYmtBQ2NUV0J6VkhvbStHK1VhYWJ4MS8wV3BxWTFhZjY3Rllp?=
 =?utf-8?B?RUVEVDNqbXE3NTdWdmVSWFNNZmp0cVRYOHdZY0R1SU9ta3Urc3RmZGxkRUcy?=
 =?utf-8?B?eXpPcTU5dm9UYjBBNzZsZFFFdWJzV1ZuV1J6ZzlkNXpkMXlaNnAzdz09?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: d40e9f1d-5f06-4d58-57ad-08de75f658b2
X-MS-Exchange-CrossTenant-AuthSource: GVXPR04MB12038.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Feb 2026 11:50:04.4585
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 5ff9FuYp0Mbrs90zS4u8P3gfBG1ygyfzHU2T/EuPYc7RIYUO5uPGuAObMhkmRbezy62crveH5XdU6H9oqCG2hYqSj1prm+h4tpeHL6sybhI=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GVXPR04MB10024
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Fri, 27 Feb 2026 11:50:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/9012

Hi Antonin,

On 2/17/26 11:02 AM, Antonin Godard via lists.yoctoproject.org wrote:
> On Tue Feb 17, 2026 at 8:59 AM CET, Daniel Ammann wrote:
>> Hello
>>
>> It looks like links within the 'Mega' Manual do not work.
>> E.g.
>> - Go to https://docs.yoctoproject.org/
>> - Switch to the 'Mega' Manual.
>> - Click on one of the links to within the document (e.g. "Build Host").
>> - The link is now https://docs.yoctoproject.org/singleindex.html#document-ref-manual/terms#term-Build-Host
>>     and doesn't work.
>>
>> I tested with firefox and chromium.
> 
> I have found that the issue was also reported upstream, and have sent a patch to
> our Sphinx recipe that is used to build the documentation on https://docs.yoctoproject.org/:
> 
> https://lore.kernel.org/r/20260217-fix-sphinx-singlehtml-uris-v1-1-763a999c54db@bootlin.com
> 
> If you are building the documentation yourself, make sure to revert the commit

Maybe rather suggest to use a version which isn't impacted? This is much 
easier than reverting a patch? According to 
https://github.com/sphinx-doc/sphinx/commit/c93723b80396959e19442f7058ad3412eaf11468 
the commit is in version v8.2.0 and later. So anything below that 
version should be fine.

I'm wondering if we should enforce that in Pipfile and pip3_docs.sh 
maybe? We'll have an issue once a new release is published with this 
fixed where we'll want Sphinx to not come from a specific range. At that 
point, I guess we can refuse to build singlehtml from the Makefile 
directly if sphinx-build is in that unsupported range.

What do you think?

Cheers,
Quentin


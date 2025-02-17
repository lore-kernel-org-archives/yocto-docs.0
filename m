Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51C3AC021A9
	for <webhook@archiver.kernel.org>; Mon, 17 Feb 2025 17:10:21 +0000 (UTC)
Received: from PA4PR04CU001.outbound.protection.outlook.com (PA4PR04CU001.outbound.protection.outlook.com [40.107.162.0])
 by mx.groups.io with SMTP id smtpd.web10.57545.1739812219428900996
 for <docs@lists.yoctoproject.org>;
 Mon, 17 Feb 2025 09:10:19 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=J1YgQHLA;
 spf=pass (domain: cherry.de, ip: 40.107.162.0, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dco8SOujm4mfOBCngiMkZovlHtWzREJZ0E8GBCE3RwbSG9QMju9xoaVcyuvIVHJ153esTlHwLyT+Ep4kIFM0Piwm4sxt2wNV03TBVbxn/0k2qT9gaAn0u2x0kAixHPO5Z92+SyjxhlPwmlISs0UJhpKLgKanv6h5vdwbY2H7GvB0kR3ChaH7djkgEw1SRPiFQ7aLME0BsB2DdGVbh5dfaOIN+F04DHQbgEjropMdWtA7hIxtAQ63/zvnbK3AFh8cxrln7Vte3CutSpjFYQgYO+B2YKEUb2lBlE7A2BTWSWREkCwpidQZN76dnRG+aBpBJSZQcgBRj3vOrcbOGOjciw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EKUxN63bh7O6BQHD9ZeQXXj33N3d6EtUOEKnzFVwuYc=;
 b=XvLSqz3jaZomIiqamzqzVO2h108fvKw+Y/nc/+LzC6zyBgWGdzwMFe3OQQchlGVvewVZM3DkXDYCF6CspnRo7Ltmsq6HYwGlF/bd/4KzSnPvbE6tszAu7Nv4/dKcZnV+BAtImV9YD0m8PlO/q0JHvnxj2m6hrE+W18Yid/QeWFCBFIBNS8YWcRmQuk5Jrx6T5cHaXxwCF4QERH0qDSZlI2Ew3fzhOTfy1uuysIGwds9g06MdSBvqduEJNBUauyFbZqSKOaL3hgXxpm34Uexb9rA3E8y1NF0nBnbJrhxairk4yHkJ7xx9q9deyE0yEuGN2PuKHgnJISvJq45gcKE9/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EKUxN63bh7O6BQHD9ZeQXXj33N3d6EtUOEKnzFVwuYc=;
 b=J1YgQHLACYwsIrrCE/1To4SqFhIECgjcBN0kqPzFUcRzJSl4vSj3QgoHGhWoS/6ddD0bYiygh5lijSdQzY+OUy7K37oK0IOALVbNtei8yU9mu6XBcebq328qgOqujzfA3jevbVbZo4XCZ42u6vW4gYrJXvuSrw2Jj/VkgnSdRsY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com (2603:10a6:20b:42c::20)
 by VI0PR04MB10342.eurprd04.prod.outlook.com (2603:10a6:800:219::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8445.19; Mon, 17 Feb
 2025 17:10:16 +0000
Received: from AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a]) by AS8PR04MB8897.eurprd04.prod.outlook.com
 ([fe80::35f6:bc7d:633:369a%6]) with mapi id 15.20.8445.016; Mon, 17 Feb 2025
 17:10:16 +0000
Message-ID: <4f94b895-6470-4e4a-a84c-1eff294d869b@cherry.de>
Date: Mon, 17 Feb 2025 18:10:15 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] [PATCH] contributor-guide/submit-changes: add policy on AI
 generated code
To: Richard Purdie <richard.purdie@linuxfoundation.org>,
 antonin.godard@bootlin.com, docs@lists.yoctoproject.org
CC: tsc <tsc@lists.openembedded.org>, Yocto TSC <tsc@lists.yoctoproject.org>,
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>
References: <20250212-ai-policy-v1-1-c9cc7510e317@bootlin.com>
 <178a6b27-d616-4fd0-b675-ba4f2767656b@cherry.de>
 <3bf717794dcd19ba91262b1037daf6c6118f1725.camel@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <3bf717794dcd19ba91262b1037daf6c6118f1725.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0011.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:15::16) To AS8PR04MB8897.eurprd04.prod.outlook.com
 (2603:10a6:20b:42c::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: AS8PR04MB8897:EE_|VI0PR04MB10342:EE_
X-MS-Office365-Filtering-Correlation-Id: e61b25ec-bf86-4dd8-c2e1-08dd4f75f31f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?NPCT1flmbPmq5gcI7HI03ZmHMYeFsXG8MIbpWCnkvCkeNblMq0P3IgpS84PC?=
 =?us-ascii?Q?1Sr1TBegjownWenVhpPj46cC4O1A0rI8ERQzyI8qds8TciW/s1jtkd1BettM?=
 =?us-ascii?Q?5N7IlFUmXMoGioRc/9NJPn8YqSC0BR+g4c3LUyyvsnqfUzdJoZIxAZfD+N8P?=
 =?us-ascii?Q?cCT8GSAqrL9KVVOwCJoxcc+d/gE5BQwoztTHIdqs8Ppe794lBLhTQz9nV+pB?=
 =?us-ascii?Q?nwBMg7eRCK+lEWhu+NxdDL+onDbUnXh2vUkgT05LmDfkakXNVyID8QdpBoYr?=
 =?us-ascii?Q?cwCgdWziDf0VnGZxUC38KB6vLq4Qp971qHxaq9KrGJKV/VZJrPC5LdFIY88S?=
 =?us-ascii?Q?IDhdTiWiISL4X67/PYg3OTnuYapcQNEpCmxPeKoH0pWFoylWcs6QAXYDt4na?=
 =?us-ascii?Q?J1xRuE89/7HTH1tlZTuHAAaBq/L/K6feiNeub1TMYWmBUEuU8/0SQ0TB8eHH?=
 =?us-ascii?Q?op4fqY6JymmpPLNJoOOJ+WPPuR7cPV8AeEK2gUVmqBl7Q8qv5HgxmB+fP8cZ?=
 =?us-ascii?Q?DShVEXYYIVgY2fUAA4DEDYBrLz+gi2xRr1PGSOzs7pXiVeGDtDR/MCTjdKeR?=
 =?us-ascii?Q?N15dU3pdUXHUsVsPDbx6LyOz5mChaQRQEsMSs5J7ckZmN8VLfAdX+57joCHC?=
 =?us-ascii?Q?t/MxscGQhmnBfNt7QP8PFBMrjD6DdRH5BSwf+AEzm8NV0Hz9em1L6tXe/ojS?=
 =?us-ascii?Q?r3xntp1XgbF9Xj3w4VVGNLLo7MeAoETBzQYiIGYn4vvBUnWYYG3oXE5aYJbq?=
 =?us-ascii?Q?UprJDMYue0ffHs9Mjkz0UCe+6EKCMSq/YK3q/FIrhKCtzq/xYNCd7Ux9fQvS?=
 =?us-ascii?Q?Kr0zkfwzzbX5KVzAVNY8libf+kdiEE9yQQB3sv6xnczRQ38nFe/jqPlJVW5N?=
 =?us-ascii?Q?PXnGfY3o1jYJT5M5UellKPXKsNidd+QMwg+w0IQNE2r4+cuhkIPtVtx/fu2J?=
 =?us-ascii?Q?NhbyXlSJO0kevbxCbTIuKsROBnV4N6D65bd7hprAcSoje7z1RWxIIQ7DythO?=
 =?us-ascii?Q?9nqQDT/FaimP1Xx6gtEv6Kh39YMlelTsVwT4edyTHhI8odZWSLkmdCmj0cxe?=
 =?us-ascii?Q?AcJLbcYAkD10bnkuVSkgQWXj3rYozvW9yvwEBHDzK4eavzZlxWYU1WQVk+PV?=
 =?us-ascii?Q?P/BlSh7/Um/MZjmA7wWjDpwr00biiPoYameSZAftMsBdvRa3NmhU7OF1Lrle?=
 =?us-ascii?Q?iaV6EyVfiZRp31ODFpqumCiXw9R/yvSgS0cr3gFVqvVlT3o/j+UfS2+JokYT?=
 =?us-ascii?Q?TR/jbioP5OkmhDCLH/OdOzyq1EoRy2jz4TF2kqn3oxu9xWa8IpjVpkLRBZzy?=
 =?us-ascii?Q?FG2auGDPd3+cQMIQi6ZHpJ2A?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AS8PR04MB8897.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?leg1dyV7wxMU7NzN5kl51Cr3QV4vKjPfKX1BNVONYYZyKLKZyV6IYW0R5Xs5?=
 =?us-ascii?Q?a7Qko5aNEYSe2/APtLqs2UQS/9Bqm0YWSrpj4pA6LfoYnOdrjz1oz6+inMnu?=
 =?us-ascii?Q?ETD/Q64ack4XzgA+8qjYUsIK4ROu22z2VLFAlGOrE/NkjLBypZKZ/fhnn+Wu?=
 =?us-ascii?Q?wOBeCgNAjnSqfYFBVh4uMZkRicdlBQVXtrq5hOB6JFcfXaFhT2t7aCdsWF/A?=
 =?us-ascii?Q?ciWU/mT3jITiZxKDnjEWN8YAdFiKmHLEinuMnBP2rnYu/pEsh3ccAsPUYl8F?=
 =?us-ascii?Q?rg8/et3y9USWj/V3qNbR2wALPz/2575ohj4MM10ppRQm6IZQsSs0LyRGHzJq?=
 =?us-ascii?Q?4QRlm/RKC1BLeACEKTAxgj6sIzSdm0edKkYOdzicorBcsMrWete9loEmlEv5?=
 =?us-ascii?Q?zBr/yOtOzh3wIHK3T1xW0+4HE9jIDW3vM/N4Hvxqc6PHaMmoLKCH4QNEF8nB?=
 =?us-ascii?Q?d4M1A6nZuK2X8ZnbdzQYsQwRcUyY5LpKIUsucfFKqDWneusUZHBrj0EQwrPX?=
 =?us-ascii?Q?0Uec8oxwV9yrzz3UnPxxtUjCRoEcsaP+bFSM9ltdKAgJUJYxdxrYI29K/5VK?=
 =?us-ascii?Q?aiamy2oq5uha1U7sGHwQ19vprc/ki9dyQGWinxgEuu8aZEGLf6PNItAXvj61?=
 =?us-ascii?Q?x52VN4pXWJNaG+Hw88UriWJZeFlmPPtMCofzwdoCUrxTC4cTotBQfjOtqqM2?=
 =?us-ascii?Q?wRwFMCdu9YhpWhp5wUw/LgQxNX4+BNIyZhX0XejuqfMzzpl6M6m9H1WRnLe5?=
 =?us-ascii?Q?rJPb/G9aktND7fbNRDPsGkHuFwbZgRe5aXIbN9G/VcNVUrxfqfLFFZKLgr1G?=
 =?us-ascii?Q?1WvyQvJmDFuGRWT4qngZ1+vLP6HcJNeMiseetAqv4Dk6BJV4WsHrE+Oudu1h?=
 =?us-ascii?Q?7YvK4yNRjqLwZxny+HW9Q4Oe5ltwLroJMxextHB8Yi6gL1NZCh9sABlZaL2g?=
 =?us-ascii?Q?r4XF1DJXQviX9ThVfIRWJ+PBaoN15UIXsmWeNgpnm/4gOUBSTgzl5V/eSlep?=
 =?us-ascii?Q?p8bsJX2iY+2HvnpJyjkxgHX6EhzjxJjQTfSIX0L5AjAZSIZ1PgM2l3Ztzj6d?=
 =?us-ascii?Q?34RJZ9MH8g0A2/mdbpPEwTEFilwtSsugsHaXNd6Y+MxfvxyS5gPOT/thWtf/?=
 =?us-ascii?Q?GHLurAayUuqQUsrKYclE9O7Y1MEH7rU7rJPAD0Nlh54jZLrkgxagDHQzUq85?=
 =?us-ascii?Q?gsPsgEygFBJUt7kqm/sVBgqblcle2fv1gENjqJ+qijs+8Ig1Hxm1lcnKQER+?=
 =?us-ascii?Q?+/NzW1Fg3pPkLmbDq+/dP5XpT0UdAYNdO4LbIcgStELYtVHcaCTU2t/wPG08?=
 =?us-ascii?Q?WvQZlJTbdjo56RvdvHcGbdhpsijWG2MK3JSnFJq6f5tEf/AYav0fQte2JwTW?=
 =?us-ascii?Q?QUKQLoiZgKglnnKEbOrH06inUcXNszrtd8H0rtdGlsQZGXkyS6u6+OCOukuQ?=
 =?us-ascii?Q?EbW50T+8ziArc27pHpAHmEVqbJLqjiZDF722dVUsvg2709jVEADW1TNGAV6X?=
 =?us-ascii?Q?l+EX5yQrMeb7fkfJB4vDN/hQSVq6sQ9LQ1O1yLiyeE7w6AhX7uvZFw/gyF0I?=
 =?us-ascii?Q?perh9Xt+rrxF51Xfx5ll4zucY75h0aNq3u1hh8rsH4tt9+SMQb1gbfIysEOj?=
 =?us-ascii?Q?Lg=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: e61b25ec-bf86-4dd8-c2e1-08dd4f75f31f
X-MS-Exchange-CrossTenant-AuthSource: AS8PR04MB8897.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2025 17:10:16.6255
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yaixLjCnblceFDFmsjGoJqWW5jLxXqwc0C56ZUQ+HBEJYntxg0xVIlsMb+5pAlTrdis7PfHQcit5uV8UPzTpHS1hL1TQi6LTLqOCHhnTgao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10342
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Mon, 17 Feb 2025 17:10:21 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/6401

Hi Richard,

On 2/17/25 3:30 PM, Richard Purdie wrote:
> On Mon, 2025-02-17 at 12:20 +0100, Quentin Schulz wrote:
>>> +indication that this code was AI generated.
>>> +
>>> +For example, here is a properly formatted commit message::
>>> +
>>> +=C2=A0=C2=A0 component: Add the ability to ...
>>> +
>>> +=C2=A0=C2=A0 AI-Generated: Uses GitHub Copilot
>>> +
>>> +=C2=A0=C2=A0 Signed-off-by: Your Name <your.name@domain>
>>> +
>>> +The ``Signed-off-by`` line must be written by you, and not the AI help=
er.
>>> +As a reminder, when contributing a change, your ``Signed-off-by`` line=
 is
>>> +required and the stipulations in the `Developer's Statement of Origin
>>> +1.1 <https://developercertificate.org/>`__ still apply.
>>> +
>>> +Additionally, you must stipulate AI contributions conform to the Linux
>>> +Foundation policy, specifically:
>>> +
>>
>> This is exactly the content of the link provided above. I'm not sure we
>> should duplicate it? E.g. it could be updated and we could then have
>> conflicting instructions there. Should we say which one takes precedence
>> when there can be a conflict?
>=20
> It was deliberately duplicated so that if it changes we know what it
> said previously. This version here is definitive.
>=20

Which version is definitive? The Guidance page from LF without a date=20
nor a version? Ours? What if the LF changes the content and we don't?=20
Which one takes precedence?

Cheers,
Quentin


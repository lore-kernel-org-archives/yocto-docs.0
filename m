Return-Path: <quentin.schulz@cherry.de>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12628D37E56
	for <webhook@archiver.kernel.org>; Wed, 14 Jan 2026 15:44:06 +0000 (UTC)
Received: from GVXPR05CU001.outbound.protection.outlook.com (GVXPR05CU001.outbound.protection.outlook.com [52.101.83.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.13272.1768405438342838383
 for <docs@lists.yoctoproject.org>;
 Wed, 14 Jan 2026 07:43:58 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@cherry.de header.s=selector1 header.b=DvTPC498;
 spf=pass (domain: cherry.de, ip: 52.101.83.45, mailfrom: quentin.schulz@cherry.de)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UYuj3vE+5zQN7UHg44Otq6KzBNfoIWJ3Ta1Q6FHOSDpqHUR6G7ZTmoaA9hdV5Akyyoi+D6Ij4Cl+MmvXbbmmoS5u9c1zcDQ3Nmkrwo6DGpSSZcRcKRLqC65lSMMdwl3d2r/ScgRhesM2YcDydVDxqSO66MB3ekGkb2evk3ooTEKA0cO26F/rU4zN2+xLcp8kqAEQXDrbsBTF7G57SVeqBAP8WTbbhDy0tkWf6xf7Svj+SC7TFgDJJTFaqeC3gIO85WU42Pf5OR3NfODoqrzthj8WJxL/DOYMgy1U1RNDMi0NMC+n5RIbxisw07k1/2stBOYIXNrWjafBuqB9v7W/Gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IjN4e3cNhIZMWV4LKIvgOjTNAATxaL83KORgT7mEog4=;
 b=Dp6I6l60cXMKLAUtkTtFmuxTPYYjXqzaQIuLyTqtQInIPpGpFJrD27Sjru0fDNvnTroNOTO0Sx8eWHP8UKP9FFkA8IGtTVS0dHQZb+edEz/7x5a8fMtSDQiU8ONk49O9mTINcf84dL1/LixSGcMRHOAHxz73y4tPrVseHZYJRvG3a+xmvC7b/Bbva8JnvjyBqF/J8bgeE3Jg5lptfDKz6w8/eYUdWl8b+PjPPxEDZw1/SJsa2fwTFtSHi+ym3OYm+0cEPnuk+nysiSutgp0D5iStWPk/SSQFkmRhGCWnFBYCYMHcR/I4Kt318NIZB1YSiUMMtYXkqc3ygYKqzT5n1A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=cherry.de; dmarc=pass action=none header.from=cherry.de;
 dkim=pass header.d=cherry.de; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cherry.de;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IjN4e3cNhIZMWV4LKIvgOjTNAATxaL83KORgT7mEog4=;
 b=DvTPC498ooG4tgJh39ECYILbz4DCPhuKX7g7FfgSVF/RAu00MwaJtYjLVDFto7tVAlX4d3sTDHUcYn95OtsQ+LxGT18WHVs5IBOFMd7KsuSZD35cz4FIxnCCqp62lFyCj7EQGjEXIiaHS0wKxDpuEyFBrENJ2xkqAu/hrlh7D4I=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=cherry.de;
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com (2603:10a6:10:643::14)
 by DUZPR04MB10063.eurprd04.prod.outlook.com (2603:10a6:10:4af::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 15:43:48 +0000
Received: from DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b]) by DU4PR04MB12026.eurprd04.prod.outlook.com
 ([fe80::2c21:dc0b:a3c5:531b%5]) with mapi id 15.20.9499.005; Wed, 14 Jan 2026
 15:43:47 +0000
Message-ID: <4fd673bb-3f25-45fc-8093-3806cc471cfc@cherry.de>
Date: Wed, 14 Jan 2026 16:43:43 +0100
User-Agent: Mozilla Thunderbird
Subject: Re: [docs] BB explanation of BB_ENV_PASSTHROUGH is confusing
To: richard.purdie@linuxfoundation.org, rpjday@crashcourse.ca,
 YP docs mailing list <docs@lists.yoctoproject.org>
References: <5cc0f4e6-3722-74a3-cf42-4f919d1ed314@crashcourse.ca>
 <e88a8ee06cbb9c3f25cd7485c898308fccd4b08b.camel@linuxfoundation.org>
Content-Language: en-US
From: Quentin Schulz <quentin.schulz@cherry.de>
In-Reply-To: <e88a8ee06cbb9c3f25cd7485c898308fccd4b08b.camel@linuxfoundation.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: FR0P281CA0260.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:b5::17) To DU4PR04MB12026.eurprd04.prod.outlook.com
 (2603:10a6:10:643::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR04MB12026:EE_|DUZPR04MB10063:EE_
X-MS-Office365-Filtering-Correlation-Id: 424c81e4-28ea-4f3a-4b8f-08de5383b499
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?hEMrL4/kCH7r4aTTfYjIKsHoi7zgX8siTWV1Tl9fch7g3MAdXtU4KuL5qW1J?=
 =?us-ascii?Q?Q1RTLMkwKNv0CtN6+MV4yINru8s4zcW3itpFOjwDg4lBmhAT6Dey97WwNBn6?=
 =?us-ascii?Q?1RQG0axR4EtHXb+QhM+FFaw5732UVwBnEo1qrVmAn7rGIxYAuFrBkzBXU8gq?=
 =?us-ascii?Q?O9oz0dBsKVD+Hlhw6RwyNPwDnOhSXGw2EqHOgOw3UnDANyc+CNWEmSEJkjKP?=
 =?us-ascii?Q?4oNPKfUBTQ0XU5IaOwdw/TrSy+oYs8PA9besvtrQFia/+Sv621TGWuqzySCw?=
 =?us-ascii?Q?H9ft4OQ9iZOphdk/HlRFddv1Kd80y3o4xaZ0I6PZUKeCu6lZl9XDf1+OXrSb?=
 =?us-ascii?Q?Kpb/PxqUfN5xK6E/LUSXikkB7bP+c3ePgUKrwHL2qkEG95STBbS/QRXFgDqd?=
 =?us-ascii?Q?VVMPI5W+ISymGXkF9q4xhVsBgh6OE3qwL1Dk6SOD6Prs08MMsQWA86LnXbuh?=
 =?us-ascii?Q?DyOW9IeCU32SXE2G7IyznlG9AKH900oHPTs+OR1ZOjEOfoHdk74N0PzDgiIg?=
 =?us-ascii?Q?5e3SyLzjBhpBBOgE5tFniKqepZTmhmb947scUXMdneDKFk932l+dI9k6OVfs?=
 =?us-ascii?Q?a47gtB6XMJiwk/4EQ5M83qB0MowGBPfQZVw45cKzkpvQ/u1nA7tCbOjlXRkz?=
 =?us-ascii?Q?8EqOpfnIN0E9ftJLOma8EShfF1gqNKXOFsXmOCyBe26PoYsQez47zzj5SWB3?=
 =?us-ascii?Q?1QnIXdK5In2Of9B5BapQ2jnAp0MlUK0766qQUbKSxSYPil92N/w4PyLS6ij3?=
 =?us-ascii?Q?tEB6yJrsN0bu+Ed2mF5/3y0U783GZmUCnQZAei7z96/S51Rpgl+USNLo+fAb?=
 =?us-ascii?Q?o7M+iGJlx76gW0BcNZ6ptKUCk9w++fLmyzVuqbblR1Bc111HyybwUQ2EBswm?=
 =?us-ascii?Q?hLVrX2PyTndZHNUpKIkwCHDiyXyBA7dh98flVE/6ralHA9ZjvGZbMVDL9Jzv?=
 =?us-ascii?Q?92+KZxw/SsZWNPwKRNrBDG5ty71CT1od44kj0/5cjscWA63+VOUGVwDf1Akd?=
 =?us-ascii?Q?crOZM4Y178ARebzcEZGw1MH5nFATtoLb3cQ60XgFMgVU+qX7w6Nbq4B02uMs?=
 =?us-ascii?Q?odfXAnIkdmkE+RDRycXFZUaM7KubjiX0vz+SmAFyrjX/RcC/K++3gDjvMVtO?=
 =?us-ascii?Q?0dI6rJzZSTZYZo2w1GTAg1pAbsisp8WneC7I0F8NmVdo/x8fxc1mk0tejxwi?=
 =?us-ascii?Q?LjQo8RFyjeIwCUYwmI9prRngOuA03DmC68M+wPQlgAmq0bJNWpr2N57tXUxx?=
 =?us-ascii?Q?FLAQHTYKLmqt19oYrv4g3SDMP+PQZF6NIVKBhPXYtQs+vIwXWPnrRPssjuuH?=
 =?us-ascii?Q?XLHpagm+P1NmxewoLG4S2hCkpQzbZt+LgGyAgsWxXGhTL2liIlPCU5Ewc/6z?=
 =?us-ascii?Q?oZDECj37BPgQOYkH4dW76ZheOmptLGcALMCqSUOYy+N4XWjngR+nZjO/mNR+?=
 =?us-ascii?Q?PEzeoekp/rFo0x9SGWHEPSsvof+gNWY2FP8GVn/ZDhHGsavsst1FkT6Xnwu2?=
 =?us-ascii?Q?9WYVpdOLu5SEuoW6O2il0ZNedRsLAz2K9Vw8?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR04MB12026.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?n3Kh1mdBbfT5/3sAtq0j9T1nN8SD+kL/vXcGlsnDSvwpmSvXCuxYPKWuW5Qt?=
 =?us-ascii?Q?QNNxErM9IqvhAXGNf+uUKYFLvkNsMwN2JTki2IW3GC/VuwCZgJi2z+hUDBpC?=
 =?us-ascii?Q?o2fAWP/4c6RiT4WPOvPEcZ5Q6ducC4VdiJN9IP7Dn68i4kA/4mgEG0Zgn/dt?=
 =?us-ascii?Q?c64cM0WJ1X3x0sGu/VTSA5fVVj5YZU3+bur9V+mwUzBIq2LKQlBVuCSbTDJX?=
 =?us-ascii?Q?P7RLVm2g3yePshcM3XTVt46RXViZzuR7sk/q4GfPgj7kTtpR/w34h+Sy3/Z/?=
 =?us-ascii?Q?FIxl9vrRCc0MK8Rq944mb65X1pYQkIWcOzBCunFsMSDjCYpxKurrPnYBfbdd?=
 =?us-ascii?Q?qWzYJY/p+/wFd2wikaWg6JopoqIOG7lRAWjsfuqaeOoPKgX9IezO4ht5hVjT?=
 =?us-ascii?Q?ckhvWMHQIXc6ekN4d2dG5FBwqBCOmgxBWDPTMxFWqYkuP7hSCQ7Y0OLnY57J?=
 =?us-ascii?Q?lSxbxAEJVmoMLcMiXcjzwgWeACDlq087CPcrxmjArsbls7qS0zNvnM7xDCud?=
 =?us-ascii?Q?bkRsDFLukcuzlEC0kT6+bD/OBxYTj56kkMJVrlXCDieNgL+8BilmFfla31FK?=
 =?us-ascii?Q?jZtwDNEvFcKP3uPdkYUJefKbLh0o1FJP7djOEaZBAXHLxkFfA3tKitRgyoZF?=
 =?us-ascii?Q?t6ZGRmL8cXcfbw0U7fLcFcOlVZ5GbTvBdiEVIeVMNvXhlY1umGV4CkImC5q/?=
 =?us-ascii?Q?7VlSmU4eM3+2J7+/tX3NqinLyGZVETz6f/VA75E0UgrBypJd5K9AJSeqE6uT?=
 =?us-ascii?Q?sik7DEb9U9jrKfr5/06mI0Or8/2yD089HYFa3asbuV38KTgx+dr5dwflHYhD?=
 =?us-ascii?Q?hRN0gv1L1ThUl4D3HN7X4JymWRPh/VWjsGGJGFxs35Rda8ugmCHdtUH+ogLa?=
 =?us-ascii?Q?l8JZZcyHtdFGt8qBZiOBwH5BiOUN1JR4Gco+FmqSrXVYNw4jQfPTFlrVvHQr?=
 =?us-ascii?Q?169YGErZ2EKHeQtdeV/YM5bSbFpXS3C9Ej5sTm9gnpJ9KvcTCG5qOHIJY826?=
 =?us-ascii?Q?TXs4cyMASJb81BWmzBMrwWH7lqpn4Ksv9KJfnO5wpmsC9coItOBWgyCWYsQl?=
 =?us-ascii?Q?bOdpwDttXPGQBNQ72Kdt4AALnrFtR021uKgAZGXpO15vsDcftXRb04LZDR+Q?=
 =?us-ascii?Q?DNlU7WCSOoxYh8UfzAFKonYdXCBIvVzJqWk695eVF9VOBnK3LCYBxuyq6ubg?=
 =?us-ascii?Q?KgsCduQPHjxleVm3xiuGGKidZiq2Elhiskb4ZFPMeRbvQIcFZ4ybJzqLE8gf?=
 =?us-ascii?Q?M7Ls/DMRF2MfJ3M+b3Jafg6fVeoGL1i02HM+dP5MaZSoIy4RP3lNpnGjlqBu?=
 =?us-ascii?Q?izTS+mBTCooPXxF1Qt+LHXYt61zboP69wJ+3E8hkWFlfZMzn7snJQrOVC43y?=
 =?us-ascii?Q?GZIuLtzKXYJxSB7N9qM2Tm6YKN9uBLzC6S1gjwks58thqwVj2ScXtA8Yveqb?=
 =?us-ascii?Q?bvW3BeC8WMRVjRxGFaUhY60XP9BPYXOsqCCSFT8UXiqDDXtGKA2xtYehR3t/?=
 =?us-ascii?Q?XJeolP/Ai4MhzcWsCekW252+piIWEhWLuTfbTaPkZNqW46UUzdOBy0eq0vPq?=
 =?us-ascii?Q?HHGYLiaBsm4eFHK/EEmgiJucQzFi8gzzTNBpC5NUOQzBxVMPtgM7SRCw7MWQ?=
 =?us-ascii?Q?D4myCcJZKwrei+VxWXow+7dQaDYsrMtUkERpr1bqrSsZ0bPx9Rf90R8jN47B?=
 =?us-ascii?Q?LOV9TGSoVI6falRcwYqzCsIOfjq2wzHb4QjepBkwMmIf0e30uLW4I0fb4GnL?=
 =?us-ascii?Q?D8MIE0wBtA=3D=3D?=
X-OriginatorOrg: cherry.de
X-MS-Exchange-CrossTenant-Network-Message-Id: 424c81e4-28ea-4f3a-4b8f-08de5383b499
X-MS-Exchange-CrossTenant-AuthSource: DU4PR04MB12026.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 15:43:47.0012
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 5e0e1b52-21b5-4e7b-83bb-514ec460677e
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PPFhxdaxrxEZzeKZLPJiNO5SEStwTVmassc/IyfrnEraa1i7JjhvL+G541CqZHqhIxnufaTxvIXhpEqwMXJRBtleURlXqoroCwPquVa20yA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DUZPR04MB10063
List-Id: <docs.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <docs@lists.yoctoproject.org>; Wed, 14 Jan 2026 15:44:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/docs/message/8558

Hi Richard, Robert,

On 1/7/26 3:46 PM, Richard Purdie via lists.yoctoproject.org wrote:
> On Wed, 2026-01-07 at 06:39 -0800, Robert P. J. Day via lists.yoctoprojec=
t.org wrote:
>>
>> here:
>>
>> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-m=
anual-ref-variables.html#term-BB_ENV_PASSTHROUGH
>>
>> the explanation:
>>
>> "Specifies the internal list of variables to allow through from the
>> external environment into BitBake=E2=80=99s datastore. If the value of t=
his
>> variable is not specified (which is the default), the following list
>> is used: BBPATH, BB_PRESERVE_ENV, BB_ENV_PASSTHROUGH, and
>> BB_ENV_PASSTHROUGH_ADDITIONS."
>>
>> seems weird since it suggests that if the value of that variable is
>> not specified, the list that is used recursively *includes* the
>> variable itself. and this doesn't seem to match the code from
>> lib/bb/utils.py, which does *not* include that variable:
>>
>>  =C2=A0 def preserved_envvars():
>>  =C2=A0=C2=A0=C2=A0 """Returns the list of variables which are taken fro=
m the environment and
>>  =C2=A0=C2=A0=C2=A0 placed in the metadata."""
>>  =C2=A0=C2=A0=C2=A0 v =3D [
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'BBPATH',
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'BB_PRESERVE_ENV',
>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 'BB_ENV_PASSTHROUGH_ADDITION=
S',
>>  =C2=A0=C2=A0=C2=A0 ]
>>  =C2=A0=C2=A0=C2=A0 return v + preserved_envvars_exported()
>>
>> can someone clarify how that explanation should be interpreted? or how
>> it might be made clearer?
>=20
> It probably needs updating after this:
>=20
> https://git.openembedded.org/bitbake/commit/lib/bb/utils.py?id=3D0a33b560=
233b983456178541603ab96fea22238b
>=20

See=20
https://lore.kernel.org/yocto-docs/20260114-env-passthru-v1-1-fd5ef76eab61@=
cherry.de/

Cheers,
Quentin


'use client'

import { useState } from 'react'
import { useRouter } from 'next/navigation'
import styles from './Login.module.css'

export default function Login() {
    const [username, setUsername] = useState('')
    const [password, setPassword] = useState('')
    const [error, setError] = useState('')
    const router = useRouter()

    const handleSubmit = async (e) => {
        e.preventDefault()

        // Convert the form data to URL-encoded format
        const formData = new URLSearchParams()
        formData.append('username', username)
        formData.append('password', password)

        try {
            console.log('Sending request to backend...')
            const response = await fetch('http://localhost/api/v1/login/access-token', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/x-www-form-urlencoded',
                },
                body: formData.toString(),
            })

            if (!response.ok) {
                console.error('Response not OK:', response.status, response.statusText)
                throw new Error('Login failed')
            }

            // Handle successful login
            const data = await response.json()
            console.log('Login successful:', data)

            // Example: Storing the token in localStorage (if needed)
            localStorage.setItem('access_token', data.access_token)

            // Redirect to /Admin
            router.push('/admin')
        } catch (error) {
            console.error('Error during login:', error)
            setError('Login failed. Please check your credentials.')
        }
    }

    return (
        <div className={styles.container}>
            <h1 className={styles.title}>Login</h1>
            {error && <p className={styles.error}>{error}</p>}
            <form className={styles.form} onSubmit={handleSubmit}>
                <div className={styles.formGroup}>
                    <label htmlFor="username" className={styles.label}>Username:</label>
                    <input
                        type="text"
                        id="username"
                        value={username}
                        onChange={(e) => setUsername(e.target.value)}
                        className={styles.input}
                        required
                    />
                </div>
                <div className={styles.formGroup}>
                    <label htmlFor="password" className={styles.label}>Password:</label>
                    <input
                        type="password"
                        id="password"
                        value={password}
                        onChange={(e) => setPassword(e.target.value)}
                        className={styles.input}
                        required
                    />
                </div>
                <button type="submit" className={styles.button}>Login</button>
            </form>
        </div>
    )
}
